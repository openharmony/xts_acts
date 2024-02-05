/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import util from '@ohos.util';
import media from '@ohos.multimedia.media';

letuuid;
letsysSupport = drm.isMediaKeySystemSupported("com.clearplay.drm");
console.log("sysSupport is", sysSupport);
if (sysSupport === true) {
    uuid = "com.clearplay.drm";
} else {
    uuid = "com.wiseplay.drm";
}

export default function abilityTest() {
    describe('ActsAbilityTest', function () {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(async function () {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
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
        console.info("--------------------assertContain-------Stage-----------------------");

        function stringToUint8Array(str) {
            const length = str.length;
            const array = new Uint8Array(length);

            for (let i = 0; i < length; i++) {
                array[i] = str.charCodeAt(i);
            }

            return array;
        }

        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0100
        * @tc.name      : testCreateMediaKeySystem
        * @tc.desc      : Reliability Test
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0100', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            expect(drmMediaKeySystem).not();
            drmMediaKeySystem.destroy();
            expect(drmMediaKeySystem.getStatistics()).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0200
        * @tc.name      : testCreateMediaKeySystem
        * @tc.desc      : Abnormal UUID
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0200', 1, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem("405E6D359B9A41E8B843DD3C6E72C42C");
            expect(drmMediaKeySystem).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0300
        * @tc.name      : testCreateMediaKeySystem
        * @tc.desc      : null UUID
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0300', 1, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem("");
            expect(drmMediaKeySystem).assertUndefined();
            done();
        })
        // /* *
        // * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0400
        // * @tc.name      : testMediaKeySystemSupported
        // * @tc.desc      : one params
        // * @tc.size      : MediumTest
        // * @tc.type      : Reliability
        // * @tc.level     : Level0
        // */
        // it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0400', 0, function (done) {
        //   letisSysSupport = drm.isMediaKeySystemSupported(uuid);
        //   expect(isSysSupport).assertTrue();
        //   done();
        // })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0500
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : one params error uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0500', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C");
            expect(isSysSupport).assertFalse();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0600
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : one params null uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0600', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported("");
            expect(isSysSupport).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0700
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0700', 0, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4");
            expect(isSysSupport).assertTrue();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0800
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params error uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0800', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C", "video/mp4");
            expect(isSysSupport).assertFalse();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0900
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params null uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_0900', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported("", "video/mp4");
            expect(isSysSupport).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1000
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params error mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1000', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported(uuid, "1111/2222");
            if (sysSupport === true) {
                expect(isSysSupport).assertFalse();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1100
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : two params null mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1100', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported(uuid, "");
            expect(isSysSupport).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1200
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1200', 0, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(isSysSupport).assertTrue();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1300
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,error uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1300', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported("405E6D359B9A41E8B843DD3C6E72C42C", "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(isSysSupport).assertFalse();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1400
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,error mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1400', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported(uuid, "1111/22222", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            if (sysSupport === true) {
                expect(isSysSupport).assertFalse();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1500
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,error securityLevel
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1500', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported(uuid, "video/mp4", 7);
            expect(isSysSupport).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1600
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,null uuid
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1600', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported("", "video/mp4", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(isSysSupport).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1700
        * @tc.name      : testMediaKeySystemSupported
        * @tc.desc      : three params,null mimetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1700', 1, function (done) {
            letisSysSupport = drm.isMediaKeySystemSupported(uuid, "", drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(isSysSupport).assertFalse();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1800
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 创建各个安全等级的session
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_1800', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            letdrmMediaKeySession = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            expect(drmMediaKeySession.getContentProtectionLevel()).not();
            drmMediaKeySession.destroy();
            expect(drmMediaKeySession.getContentProtectionLevel()).assertUndefined();

            letdrmMediaKeySession1 = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
            expect(drmMediaKeySession1.getContentProtectionLevel()).not();
            drmMediaKeySession1.destroy();
            expect(drmMediaKeySession1.getContentProtectionLevel()).assertUndefined();

            letdrmMediaKeySession2 = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_HW_CRYPTO);
            expect(drmMediaKeySession2.getContentProtectionLevel()).not();
            drmMediaKeySession2.destroy();
            expect(drmMediaKeySession2.getContentProtectionLevel()).assertUndefined();

            letdrmMediaKeySession3 = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_ENHANCED_HW);
            expect(drmMediaKeySession3.getContentProtectionLevel()).not();
            drmMediaKeySession3.destroy();
            expect(drmMediaKeySession3.getContentProtectionLevel()).assertUndefined();

            letdrmMediaKeySession4 = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_MAX);
            expect(drmMediaKeySession4.getContentProtectionLevel()).not();
            drmMediaKeySession4.destroy();
            expect(drmMediaKeySession4.getContentProtectionLevel()).assertUndefined();

            drmMediaKeySystem.destroy();
            expect(drmMediaKeySystem.getStatistics()).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2000
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 错误的安全等级，创建session异常用例
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2000', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            letdrmMediaKeySession = drmMediaKeySystem.createMediaKeySession(5);
            expect(drmMediaKeySession).assertUndefined();
            drmMediaKeySystem.destroy();
            done();
        })
        // /* *
        // * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2100
        // * @tc.name      : testCreateMediaKeySession
        // * @tc.desc      : 创建一个会话，释放MediaKeySystem，检查会话是否释放
        // * @tc.size      : MediumTest
        // * @tc.type      : Reliability
        // * @tc.level     : Level0
        // */
        // //TODO:提单用例，重复执行结果不一致
        // it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2100', 0, function (done) {
        //   letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
        //   console.log("start drmMediaKeySystem 1",drmMediaKeySystem);
        //   letsession = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
        //   expect(session.getContentProtectionLevel()).not();
        //   drmMediaKeySystem.destroy();
        //   expect(session.getContentProtectionLevel()).assertEqual(0);
        //   session.destroy();
        //   expect(session.getContentProtectionLevel()).assertUndefined();
        //   done();
        // })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2200
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码video/mp4
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2200', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            console.log("start drmMediaKeySystem", drmMediaKeySystem);
            letsession = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            console.log("start session", session);
            expect(session).not();
            if (sysSupport === true) {
                console.log("start true", sysSupport);
                letresult = session.requireSecureDecoderModule("video/avc");
                expect(result).assertFalse();
                letresult = session.requireSecureDecoderModule("video/hevc");
                expect(result).assertFalse();
                letresult = session.requireSecureDecoderModule("video/avs3");
                expect(result).assertFalse();
            }
            session.destroy();
            drmMediaKeySystem.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码hls/ts
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2300', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            letsession = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            letresult = session.requireSecureDecoderModule("hls/ts");
            if (sysSupport === true) {
                expect(result).assertFalse();
            }
            session.destroy();
            drmMediaKeySystem.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2400
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码,错误的minetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2400', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            letsession = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            letresult = session.requireSecureDecoderModule("1111/22222");
            if (sysSupport === true) {
                expect(result).assertFalse();
            }
            session.destroy();
            drmMediaKeySystem.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2500
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码,错误的minetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2500', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            console.log("drmMediaKeySystem is", drmMediaKeySystem);
            letsession = drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            letresult = session.requireSecureDecoderModule("");
            if (sysSupport === true) {
                expect(result).assertFalse();
            }
            session.destroy();
            drmMediaKeySystem.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600
        * @tc.name      : testCreateMediaKeySession
        * @tc.desc      : 判断是否支持安全解码,错误的minetype
        * @tc.size      : MediumTest
        * @tc.type      : Reliability
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_MEDIA_DRM_FRAMEWORK_API_2600', 0, function (done) {
            letdrmMediaKeySystem = drm.createMediaKeySystem(uuid);
            expect(drmMediaKeySystem).not();
            drmMediaKeySystem.destroy();
            expect(drmMediaKeySystem.getMaxContentProtectionLevel()).assertUndefined();
            expect(drmMediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR)).assertUndefined();
            expect(drmMediaKeySystem.getStatistics()).assertUndefined();
            expect(drmMediaKeySystem.generateKeySystemRequest()).assertUndefined();
            expect(drmMediaKeySystem.processKeySystemResponse(stringToUint8Array("022364"))).assertUndefined();
            expect(drmMediaKeySystem.getCertificateStatus()).assertUndefined();
            expect(drmMediaKeySystem.createMediaKeySession()).assertUndefined();
            expect(drmMediaKeySystem.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN)).assertUndefined();
            expect(drmMediaKeySystem.getOfflineMediaKeyStatus(stringToUint8Array("123456"))).assertUndefined();
            expect(drmMediaKeySystem.clearOfflineMediaKeys(stringToUint8Array("123456"))).assertUndefined();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取设备证书，传入错误的响应报文数据
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0100', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letprovisionRequestData: drm.ProvisionRequest = drmsys.generateKeySystemRequest();
            console.log("provisionRequestData.data is:", provisionRequestData.data);
            console.log("provisionRequestData.defaultUrl is:", provisionRequestData.defaultURL);
            letarry = new Uint8Array([1, 2, 3, 4, 5]);
            drmsys.processKeySystemResponse(arry);
            letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            expect(session).not();
            session.destroy();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取设备证书，响应报文数据为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0200', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            drmsys.generateKeySystemRequest();
            drmsys.processKeySystemResponse(null);
            letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            expect(session).not();
            session.destroy();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,正常参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0300', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                letDrmRequest: drm.MediaKeyRequest = session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
                console.log("DrmRequest mediaKeyRequestType is", DrmRequest.mediaKeyRequestType);
                console.log("DrmRequest defaultURL is", DrmRequest.defaultURL);
                letresponseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyvalue = session.checkMediaKeyStatus();
                expect(keyvalue[0].value).assertEqual('MediaKey is OK');
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0400
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求minetype异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0400', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                letDrmRequest = session.generateMediaKeyRequest("1111/2222", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
                expect(DrmRequest).assertUndefined();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0500
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求minetype为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0500', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            letbase64 = new util.Base64();
            letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
            letoptionalData = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];
            letDrmRequest = session.generateMediaKeyRequest(null, uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
            expect(DrmRequest).assertUndefined();
            session.destroy();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求初始数据异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0600', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q=');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                letDrmRequest = session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
                expect(DrmRequest).assertUndefined();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求初始数据为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0700', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            letoptionalData = [{
                name: "optionalDataName",
                value: "optionalDataValue"
            }];
            letDrmRequest = session.generateMediaKeyRequest("video/mp4", null, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
            expect(DrmRequest).assertUndefined();
            session.destroy();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,请求的licensetype异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0800', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                letDrmRequest = session.generateMediaKeyRequest("video/mp4", uint8pssh, 3, optionalData);
                expect(DrmRequest).assertUndefined();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,响应报文异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0900', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
                letresponseArray = new Uint8Array([1, 2, 3, 4, 5]);
                session.processMediaKeyResponse(responseArray);
                letkeyvalue = session.checkMediaKeyStatus();
                expect(keyvalue).assertUndefined();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,响应报文为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1000', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
                session.processMediaKeyResponse(null);
                letkeyvalue = session.checkMediaKeyStatus();
                expect(keyvalue).assertUndefined();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 获取许可证,正常删除许可证信息，正常检查许可证状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1100', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);
                letresponseArray = new Uint8Array([0x30, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyvalue = session.checkMediaKeyStatus();
                expect(keyvalue[0].value).assertEqual('MediaKey is OK');
                session.clearMediaKeys();
                letkeyvalue = session.checkMediaKeyStatus();
                expect(keyvalue).assertUndefined();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，获取离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1200', 0, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                console.log("keyIds is", keyIds);
                letarry = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1300', 0, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letarry = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                drmsys.clearOfflineMediaKeys(arry);
                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1400
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，无效离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1400', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letarry = new Uint8Array([1, 2, 3, 4, 5]);
            letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
            if (sysSupport === true) {
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
            }
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1500
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，离线licenseid为空，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1500', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(null);
            expect(OfflineKeyState).assertUndefined();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线许可证，错误参数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1600', 0, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letarry = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);

                drmsys.clearOfflineMediaKeys(new Uint8Array([1, 2, 3, 4, 5]));

                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，删除离线许可证，参数为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1700', 0, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();

                letarry = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);

                drmsys.clearOfflineMediaKeys(null);

                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证管理，重复删除离线licenseid，检查licenseid状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1800', 0, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);

                letkeyIds = drmsys.getOfflineMediaKeyIds();

                letarry = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);

                drmsys.clearOfflineMediaKeys(arry);
                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);

                drmsys.clearOfflineMediaKeys(arry);
                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_1900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，正常传参
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_1900', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.generateOfflineReleaseRequest(keyArray);
                session.processOfflineReleaseResponse(keyArray, responseArray);
                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，请求参数异常
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2000', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letarry = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                letkeyArray = new Uint8Array([1, 2, 3, 4, 5]);
                session.generateOfflineReleaseRequest(keyArray);
                session.processOfflineReleaseResponse(keyArray, responseArray);
                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，请求参数为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2100', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letarry = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(arry);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                letOfflineReleaseRequest = session.generateOfflineReleaseRequest(null);
                expect(OfflineReleaseRequest).assertUndefined();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2200', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                session.generateOfflineReleaseRequest(keyArray);
                session.processOfflineReleaseResponse(new Uint8Array([1, 2, 3, 4, 5]), responseArray);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2300
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常licenseid为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2300', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                session.generateOfflineReleaseRequest(keyArray);
                session.processOfflineReleaseResponse(null, responseArray);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2400
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常响应报文
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2400', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.generateOfflineReleaseRequest(keyArray);
                session.processOfflineReleaseResponse(keyArray, new Uint8Array([1, 2, 3, 4, 5]));
                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_INACTIVE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2500
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证释放，响应参数异常响应报文为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2500', 0, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                session.generateOfflineReleaseRequest(keyArray);
                session.processOfflineReleaseResponse(keyArray, null);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2600
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore，创建会话1，生成离线许可证licenseid，释放会话1，创建会话2，去restore会话1生成的licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2600', 0, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession1 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session1.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session1.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session1.destroy();
                //TODO:会话销毁以后离线许可证无法获取0102
                expect(drmsys.getOfflineMediaKeyStatus(keyArray)).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_UNKNOWN);
                letsession2 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                session2.restoreOfflineMediaKeys(keyArray);
                OfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session2.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2700
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore，创建会话1会话2，会话2restore会话1生成的离线licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2700', 0, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession1 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letbase64 = new util.Base64();
                letuint8pssh = base64.decodeSync('AAAAi3Bzc2gAAAAAPV5tNZuaQei4Q908bnLELAAAAGt7InZlcnNpb24iOiJWMS4wIiwiY29udGVudElEIjoiZEhNdE1qWTBMVEV3T0RBdFlXVnoiLCJraWRzIjpbIkcrRWsvK1htVWtwQkhRZ1hZV1FRSWc9PSJdLCJlbnNjaGVtYSI6ImNiYzEifQ==');
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue"
                }];
                session1.generateMediaKeyRequest("video/mp4", uint8pssh, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);
                letresponseArray = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                session1.processMediaKeyResponse(responseArray);
                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);

                letsession2 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                session2.restoreOfflineMediaKeys(keyArray);
                letOfflineKeyState = drmsys.getOfflineMediaKeyStatus(keyArray);
                expect(OfflineKeyState).assertEqual(drm.OfflineMediaKeyStatus.OFFLINE_MEDIA_KEY_STATUS_USABLE);
                session1.destroy();
                session2.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2800
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore,传错误的licenseid
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2800', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            session.restoreOfflineMediaKeys(new Uint8Array([1, 2, 3, 4, 5]));
            expect(1).assertEqual(1);
            session.destroy();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_2900
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 离线许可证restore,licenseid为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_2900', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            session.restoreOfflineMediaKeys(null);
            expect(1).assertEqual(1);
            session.destroy();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3000
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 设备证书状态查询
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_3000', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            drmsys.generateKeySystemRequest();
            letcstatus = drmsys.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3100
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 创建system1，获取设备证书，创建system2，检查设备证书状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_3100', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letcstatus = drmsys.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);

            letdrmsys2 = drm.createMediaKeySystem(uuid);
            drmsys2.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            drmsys.destroy();
            drmsys2.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_3200
        * @tc.name      : testGetTrackDescription
        * @tc.desc      : 创建system1，获取设备证书，释放system1，创建system2，检查设备证书状态
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_3200', 0, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letcstatus = drmsys.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);

            drmsys.destroy();

            letdrmsys2 = drm.createMediaKeySystem(uuid);
            drmsys2.getCertificateStatus();
            expect(cstatus).assertEqual(drm.CertificateStatus.CERT_STATUS_PROVISIONED);
            drmsys2.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0100
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值然后获取属性值
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0100', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, "ABC");
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertEqual("ABC");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0200
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值然后获取属性值
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0200', 1, function (done) {
            letmediaKeySystem = drm.createMediaKeySystem(uuid);
            letgetCfg = mediaKeySystem.getConfigurationString(null);
            if (sysSupport === true) {
                console.log("getCfg is:", getCfg);
                expect(getCfg).assertUndefined();
            }
            mediaKeySystem.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，输入错误的propertyName
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0300', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString("version_id", "1.1");
                letgetCfg = mediaKeySystem.getConfigurationString("version_id");
                expect(getCfg).assertEqual("1.1");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，value值为空
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, null);
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0400
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0500', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, 'ABC');
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertEqual('ABC');
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, 'EFGH');
                getCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertEqual('EFGH');
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0600', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, "1.1");
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                expect(getCfg).assertEqual("1.1");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0700
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0700', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, null);
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0800', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, "Test Set Get Config");
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                expect(getCfg).assertEqual("Test Set Get Config");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0900
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_0900', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, null);
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1000', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, "AES");
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                expect(getCfg).assertEqual("AES");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1100', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, null);
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1200', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID, "7E8G9D");
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID);
                expect(getCfg).assertEqual("7E8G9D");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1300', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID, null);
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400
        * @tc.name      : testSet_get_config
        * @tc.desc      : 获取设备最大会话数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1400', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500
        * @tc.name      : testSet_get_config
        * @tc.desc      : 设置最大会话数为0
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1500', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, '0');
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertEqual("0");
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600
        * @tc.name      : testSet_get_config
        * @tc.desc      : 设置最大会话数为null
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1600', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, null);
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值，超过默认最大数64
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1700', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, "65");
                letgetCfg = mediaKeySystem.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertEqual("65");
                mediaKeySystem.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值1，创建两个会话
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_1900', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                drmsys.setConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, "1");
                letgetCfg = drmsys.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertEqual('1');
                letsession1 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsession2 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                expect(session2).not();
                session1.destroy();
                session2.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000
        * @tc.name      : testSet_get_config
        * @tc.desc      : 查看当前会话数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2000', 1, function (done) {
            letdrmsys = drm.createMediaKeySystem(uuid);
            letsession1 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            letsession2 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
            letgetCfg = drmsys.getConfigurationString(drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT);
            if (sysSupport === true) {
                expect(getCfg).assertEqual(getCfg);
            }
            session1.destroy();
            session2.destroy();
            drmsys.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_GET_METRIC_2100
        * @tc.name      : testGetMetric
        * @tc.desc      : get metric information
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_GET_METRIC_2100', 1, function (done) {
            letmediaKeySystem = drm.createMediaKeySystem(uuid);
            letsessionArray = [];
            letmetric = mediaKeySystem.getStatistics();
            for (letitem of metric) {
                console.log("XX TEST metric" + item.name + ':' + item.value);
                if (item.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                    expect(item.value).assertEqual('0');
                }
            }
            for (leti = 0; i < 64; i++) {
                sessionArray[i] = mediaKeySystem.createMediaKeySession();
            }
            letmetric2 = mediaKeySystem.getStatistics();
            for (letitem2 of metric2) {
                console.log("XX TEST metric2" + item2.name + ':' + item2.value);
                if (item2.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                    expect(item2.value).assertEqual('64');
                }
            }
            for (letj = 0; j < 32; j++) {
                sessionArray[j].destroy();
            }
            letmetric3 = mediaKeySystem.getStatistics();
            for (letitem3 of metric3) {
                console.log("XX TEST metric3" + item3.name + ':' + item3.value);
                if (item3.name === drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT) {
                    expect(item3.value).assertEqual('32');
                }
            }
            for (letk = 32; k < 64; k++) {
                sessionArray[k].destroy();
            }
            mediaKeySystem.destroy();
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2300
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值然后获取属性值(Uint8array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2300', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("ABC");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2400
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，输入错误的propertyName(Uint8Array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2400', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("ABC");
                mediaKeySystem.setConfigurationByteArray("version_id", valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray("version_id");
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2500
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值，value值为空(Uint8Array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2500', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, null);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2600
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋两次值，看最终结果是否覆盖(Uint8Array)
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2600', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("ABC");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                valueArray = stringToUint8Array("EFG");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR, valueArray);
                getCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VENDOR);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2700
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2700', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("1.1");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2800
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2800', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION, null);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_VERSION);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2900
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_2900', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("Test Set Get Config");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3000
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3000', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION, null);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_DESCRIPTION);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3100
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3100', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("AES");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3200
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3200', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS, null);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_ALGORITHMS);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3300
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3300', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("7E8G9D");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3400
        * @tc.name      : testSet_get_config
        * @tc.desc      : set config drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID and get
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3400', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID, null);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_DEVICE_UNIQUE_ID);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3500
        * @tc.name      : testSet_get_config
        * @tc.desc      : 获取设备最大会话数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3500', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3600
        * @tc.name      : testSet_get_config
        * @tc.desc      : 设置最大会话数为0
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3600', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("0");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3700
        * @tc.name      : testSet_get_config
        * @tc.desc      : 设置最大会话数为null
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3700', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, null);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3800
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值，超过默认最大数64
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3800', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("65");
                mediaKeySystem.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                mediaKeySystem.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3900
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给maxSessionNum赋值1，创建两个会话
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_3900', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letvalueArray = stringToUint8Array("1");
                drmsys.setConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX, valueArray);
                letgetCfg = drmsys.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_MAX);
                for (leti = 0; i < getCfg.length; i++) {
                    expect(getCfg[i]).assertEqual(valueArray[i]);
                }
                drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                expect(session).not();
                session.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4000
        * @tc.name      : testSet_get_config
        * @tc.desc      : 查看当前会话数
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4000', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsession1 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsession2 = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letgetCfg = drmsys.getConfigurationByteArray(drm.PreDefinedConfigName.CONFIG_SESSION_CURRENT);
                expect(getCfg).assertEqual(getCfg);
                session1.destroy();
                session2.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4100
        * @tc.name      : testSet_get_config
        * @tc.desc      : 给vendor赋值然后获取属性值
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_SET_GET_CONFIG_4100', 1, function (done) {
            if (sysSupport === true) {
                letmediaKeySystem = drm.createMediaKeySystem(uuid);
                letgetCfg = mediaKeySystem.getConfigurationByteArray(null);
                expect(getCfg).assertUndefined();
                mediaKeySystem.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0100
        * @tc.name      : test_on_off_interface_0100
        * @tc.desc      : keyNeeded on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0100', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });

                letresponseArray = new Uint8Array([0x31, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseArray);
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue",
                }];
                keySession.generateMediaKeyRequest("video/mp4", responseArray, drm.MediaKeyType.MEDIA_KEY_TYPE_ONLINE, optionalData);

                expect(sign).assertEqual(2);
                keySession.off('keyRequired');
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0200
        * @tc.name      : test_on_off_interface_0200
        * @tc.desc      : keyNeeded on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0200', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('keyRequired', (eventInfo) => {
                    console.info('bbbbb receive keyRequired ' + eventInfo.info);
                    console.info('bbbbb receive keyRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });

                keySession.off('keyRequired');
                letresponseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseArray);
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue",
                }];
                keySession.generateMediaKeyRequest("video/mp4", responseArray, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);

                expect(sign).assertEqual(1);
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0300
        * @tc.name      : test_on_off_interface_0300
        * @tc.desc      : keyExpired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0300', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('keyExpired', (eventInfo) => {
                    console.info('bbbbb receive keyExpired ' + eventInfo.info);
                    console.info('bbbbb receive keyExpired ' + eventInfo.extraInfo);
                    sign = 2;
                });

                letresponseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseArray);
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue",
                }];
                keySession.generateMediaKeyRequest("video/mp4", responseArray, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);

                keySession.clearMediaKeys();
                expect(sign).assertEqual(2);
                keySession.off('keyExpired');
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0400
        * @tc.name      : test_on_off_interface_0400
        * @tc.desc      : keyExpired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0400', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('keyExpired', (eventInfo) => {
                    console.info('bbbbb receive keyExpired ' + eventInfo.info);
                    console.info('bbbbb receive keyExpired ' + eventInfo.extraInfo);
                    sign = 2;
                });

                keySession.off('keyExpired');

                letresponseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseArray);
                letoptionalData = [{
                    name: "optionalDataName",
                    value: "optionalDataValue",
                }];
                keySession.generateMediaKeyRequest("video/mp4", responseArray, drm.MediaKeyType.MEDIA_KEY_TYPE_OFFLINE, optionalData);

                keySession.clearMediaKeys();
                expect(sign).assertEqual(1);
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0500
        * @tc.name      : test_on_off_interface_0500
        * @tc.desc      : expirationUpdate on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0500', 1, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('expirationUpdate', (eventInfo) => {
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                    sign = 2;
                });

                letresponseTest = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseTest);

                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                console.log("keyArray is:", keyArray);
                keySession.generateOfflineReleaseRequest(keyArray);
                keySession.processOfflineReleaseResponse(keyArray, responseTest);

                keySession.restoreOfflineMediaKeys(keyArray);
                expect(sign).assertEqual(2);
                keySession.off('expirationUpdate');
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0600
        * @tc.name      : test_on_off_interface_0600
        * @tc.desc      : expirationUpdate on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0600', 1, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('expirationUpdate', (eventInfo) => {
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.info);
                    console.info('bbbbb receive expirationUpdate ' + eventInfo.extraInfo);
                    sign = 2;
                });
                keySession.off('expirationUpdate');

                letresponseTest = new Uint8Array([0x31, 0x56, 0x55, 0x52, 0x53, 0x54, 0x56, 0x39, 0x55, 0x52, 0x56, 0x4E, 0x55, 0x58, 0x30, 0x4E, 0x4A, 0x52, 0x46, 0x38, 0x77, 0x4E, 0x41, 0x3D, 0x3D, 0x3A, 0x42, 0x4E, 0x4F, 0x71, 0x2B, 0x4F, 0x68, 0x6D, 0x65, 0x6B, 0x42, 0x41, 0x30, 0x36, 0x72, 0x34, 0x36, 0x47, 0x5A, 0x36, 0x42, 0x41, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseTest);

                letkeyIds = drmsys.getOfflineMediaKeyIds();
                letkeyArray = new Uint8Array(keyIds[0]);
                console.log("keyArray is:", keyArray);
                keySession.generateOfflineReleaseRequest(keyArray);
                keySession.processOfflineReleaseResponse(keyArray, responseTest);

                keySession.restoreOfflineMediaKeys(keyArray);
                expect(sign).assertEqual(1);
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0700
        * @tc.name      : test_on_off_interface_0700
        * @tc.desc      : keyChanged on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0700', 1, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('keysChange', (keyInfo, newKeyAvailable) => {
					console.info('bbbbb receive keysChange newKeyAvailable:' + newKeyAvailable);
					for (let index = 0; index < keyInfo.length; index++){
						console.info('bbbbb receive keysChange index:' + index);
						console.info('bbbbb receive keysChange keyId:' + keyInfo[index].keyId);
						console.info('bbbbb receive keysChange value:' + keyInfo[index].value);
					}
                    sign = 2;
                });

                letresponseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseArray);
                expect(sign).assertEqual(2);
                keySession.off('keysChange');
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0800
        * @tc.name      : test_on_off_interface_0800
        * @tc.desc      : keyChanged on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0800', 1, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letkeySession = drmsys.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_UNKNOWN);
                letsign = 1;
                keySession.on('keysChange', (keyInfo, newKeyAvailable) => {
					console.info('bbbbb receive keysChange newKeyAvailable' + newKeyAvailable);
					for (let index = 0; index < keyInfo.length; index++){
						console.info('bbbbb receive keysChange index: ' + index);
						console.info('bbbbb receive keysChange keyId: ' + keyInfo[index].keyId);
						console.info('bbbbb receive keysChange value: ' + keyInfo[index].value);
					}
                    sign = 2;
                });
                keySession.off('keysChange');

                letresponseArray = new Uint8Array([0x30, 0x64, 0x6E, 0x5A, 0x32, 0x4E, 0x57, 0x74, 0x76, 0x4D, 0x47, 0x34, 0x34, 0x4E, 0x6A, 0x42, 0x30, 0x4D, 0x32, 0x77, 0x33, 0x4E, 0x67, 0x3D, 0x3D, 0x3A, 0x59, 0x7A, 0x56, 0x78, 0x63, 0x48, 0x64, 0x70, 0x61, 0x6D, 0x30, 0x34, 0x59, 0x57, 0x45, 0x34, 0x5A, 0x48, 0x6B, 0x79, 0x4D, 0x67, 0x3D, 0x3D]);
                keySession.processMediaKeyResponse(responseArray);
                expect(sign).assertEqual(1);
                keySession.destroy();
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0900
        * @tc.name      : test_on_off_interface_0900
        * @tc.desc      : provisionRequired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_0900', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsign = 1;
                drmsys.on('keySystemRequired', (eventInfo) => {
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.info);
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                drmsys.generateKeySystemRequest();
                expect(sign).assertEqual(2);
                drmsys.off('keySystemRequired');
                drmsys.destroy();
            }
            done();
        })
        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1000
        * @tc.name      : test_on_off_interface_1000
        * @tc.desc      : provisionRequired on/off interface
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_KEY_SESSION_ON_OFF_1000', 1, function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                letsign = 1;
                drmsys.on('keySystemRequired', (eventInfo) => {
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.info);
                    console.info('bbbbb receive keySystemRequired ' + eventInfo.extraInfo);
                    sign = 2;
                });
                drmsys.off('keySystemRequired');
                drmsys.generateKeySystemRequest();
                expect(sign).assertEqual(1);
                drmsys.destroy();
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_DRM_AVPLAYER_0200
        * @tc.name      : test mediaKeySystemInfos
        * @tc.desc      : create AVPlayer to getMediaKeySystemInfos
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
        */
        it('SUB_MULTIMEDIA_DRM_AVPLAYER_0200', 1, async function (done) {
            if (sysSupport === true) {
                letdrmsys = drm.createMediaKeySystem(uuid);
                let avPlayer = await media.createAVPlayer();
                let keyInfo = avPlayer.getMediaKeySystemInfos()
                for (let item = 0; item < keyInfo.length; item++) {
                    console.info(`getMediaKeySystemInfos item:${item}, keyInfo[${item}].uuid:${keyInfo[item].uuid}, keyInfo[${item}].pssh:${keyInfo[item].pssh}`)
                }
                drmsys.destroy();
            }
            done();
        })
    })
}