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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import drm from '@ohos.multimedia.drm';

export default function drmEnumTest() {
  describe('drmEnumTest', function () {
    beforeAll(async function () {
      console.log("beforeAll");
    })
    beforeEach(function () {
      console.log("beforeEach");
    })
    afterEach(function () {
      console.log("afterEach");
    })
    afterAll(function () {
      console.log("afterAll");
    })

	/* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_CERTIFICATE_STATUS_ENUM_0100
    * @tc.name      : testCertificateStatus
    * @tc.desc      : test all CertificateStatus
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_CERTIFICATE_STATUS_ENUM_0100', 0, function (done) {
      expect(drm.CertificateStatus.CERT_STATUS_PROVISIONED == 0).assertTrue();
      console.log(`drm.CertificateStatus.CERT_STATUS_PROVISIONED: ${drm.CertificateStatus.CERT_STATUS_PROVISIONED}`);
	  expect(drm.CertificateStatus.CERT_STATUS_NOT_PROVISIONED == 1).assertTrue();
      console.log(`drm.CertificateStatus.CERT_STATUS_NOT_PROVISIONED: ${drm.CertificateStatus.CERT_STATUS_NOT_PROVISIONED}`);
	  expect(drm.CertificateStatus.CERT_STATUS_EXPIRED == 2).assertTrue();
      console.log(`drm.CertificateStatus.CERT_STATUS_EXPIRED: ${drm.CertificateStatus.CERT_STATUS_EXPIRED}`);
	  expect(drm.CertificateStatus.CERT_STATUS_INVALID == 3).assertTrue();
      console.log(`drm.CertificateStatus.CERT_STATUS_INVALID: ${drm.CertificateStatus.CERT_STATUS_INVALID}`);
	  expect(drm.CertificateStatus.CERT_STATUS_UNAVAILABLE == 4).assertTrue();
      console.log(`drm.CertificateStatus.CERT_STATUS_UNAVAILABLE: ${drm.CertificateStatus.CERT_STATUS_UNAVAILABLE}`);
      done();
    })
	
	/* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_DRM_MEDIA_KEY_REQUEST_TYPE_ENUM_0100
    * @tc.name      : testMediaKeyRequestType
    * @tc.desc      : test all MediaKeyRequestType
    * @tc.size      : MediumTest
    * @tc.type      : Function
    * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_DRM_CERTIFICATE_STATUS_ENUM_0100', 0, function (done) {
      expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UNKNOWN == 0).assertTrue();
      console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UNKNOWN: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UNKNOWN}`);
      expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_INITIAL == 1).assertTrue();
      console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_INITIAL: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_INITIAL}`);
      expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RENEWAL == 2).assertTrue();
      console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RENEWAL : ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RENEWAL }`);
      expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RELEASE  == 3).assertTrue();
      console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RELEASE: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_RELEASE  }`);
      expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_NONE == 4).assertTrue();
      console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_NONE: ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_NONE}`);
      expect(drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UPDATE == 5).assertTrue();
      console.log(`drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UPDATE : ${drm.MediaKeyRequestType.MEDIA_KEY_REQUEST_TYPE_UPDATE }`);
      done();
    })
  })
}