/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe,it, expect} from '@ohos/hypium';
import http from '@ohos.net.http';
export default function responseCodeJsunit() {
  describe("responseCodeJsunitTest", function () {
    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_OK_001
     * @tc.name testTelephonyHttpResponseCodeOK001
     * @tc.desc Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeOK001", 0, async function (done) {
      console.log("-----------------------Telephony_Http_ResponseCode_OK_0100 start-----------------------");
      try {
        expect(200).assertEqual(http.ResponseCode.OK);
        console.log("-----------------------Telephony_Http_ResponseCode_OK_0100 OK assertEqual SUCCESS-----------------------");
      } catch (error) {
        console.log("Telephony_Http_ResponseCode_OK_0100 : error = " + error);
      }
      done();
      console.log("-----------------------Telephony_Http_ResponseCode_OK_0100 end-----------------------");
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_ACCEPTED_001
     * @tc.name testTelephonyHttpResponseCodeAccepted001
     * @tc.desc Test Test ResponseCode property.
     */

    it("testTelephonyHttpResponseCodeAccepted001", 0, async function (done) {
      console.log("-----------------------ResponseCode_ACCEPTED Test is starting-----------------------");
      try {
        expect(202).assertEqual(http.ResponseCode.ACCEPTED);
        console.log("-----------------------ResponseCode ACCEPTED Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeAccepted001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_NOT_AUTHORITATIVE_001
     * @tc.name testTelephonyHttpResponseCodeNotAuthoritative001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeNotAuthoritative001", 0, async function (done) {
      console.log("-----------------------ResponseCode NOT_AUTHORITATIVE Test is starting-----------------------");
      try {
        expect(203).assertEqual(http.ResponseCode.NOT_AUTHORITATIVE);
        console.log("-----------------------ResponseCode NOT_AUTHORITATIVE Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeNotAuthoritative001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_NO_CONNECT_001
     * @tc.name testTelephonyHttpResponseCodeNoConnect001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeNoConnect001", 0, async function (done) {
      console.log("-----------------------ResponseCode NO_CONTENT Test is starting-----------------------");
      try {
        expect(204).assertEqual(http.ResponseCode.NO_CONTENT);
        console.log("-----------------------ResponseCode NO_CONTENT Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeNotConnect001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_MULT_CHOICE_001
     * @tc.name testTelephonyHttpResponseCodeMultChoice001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */
    it("testTelephonyHttpResponseCodeMultChoice001", 0, async function (done) {
      console.log("-----------------------ResponseCode MULT_CHOICE Test is starting-----------------------");
      try {
        expect(300).assertEqual(http.ResponseCode.MULT_CHOICE);
        console.log("-----------------------ResponseCode MULT_CHOICE Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeMultChoice001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_MOVED_PERM_001
     * @tc.name testTelephonyHttpResponseCodeMovedPerm001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeMovedPerm001", 0, async function (done) {
      console.log("-----------------------ResponseCode MOVED_PERM Test is starting-----------------------");
      try {
        expect(301).assertEqual(http.ResponseCode.MOVED_PERM);
        console.log("-----------------------ResponseCode MOVED_PERM Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeMovedPerm001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_SEE_OTHER_001
     * @tc.name testTelephonyHttpResponseCodeSeeOther001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeSeeOther001", 0, async function (done) {
      console.log("-----------------------ResponseCode SEE_OTHER Test is starting-----------------------");
      try {
        expect(303).assertEqual(http.ResponseCode.SEE_OTHER);
        console.log("-----------------------ResponseCode SEE_OTHER Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeSeeOther001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_NOT_MODIFIED_001
     * @tc.name testTelephonyHttpResponseCodeNotModified001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeNotModified001", 0, async function (done) {
      console.log("-----------------------ResponseCode NOT_MODIFIED Test is starting-----------------------");
      try {
        expect(304).assertEqual(http.ResponseCode.NOT_MODIFIED);
        console.log("-----------------------ResponseCode NOT_MODIFIED Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeNotModified001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_USE_PROXY_001
     * @tc.name testTelephonyHttpResponseCodeUseProxy001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */
    it("testTelephonyHttpResponseCodeUseProxy001", 0, async function (done) {
      console.log("-----------------------ResponseCode USE_PROXY Test is starting-----------------------");
      try {
        expect(305).assertEqual(http.ResponseCode.USE_PROXY);
        console.log("-----------------------ResponseCode USE_PROXY Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeUseProxy001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_BAD_REQUEST_001
     * @tc.name testTelephonyHttpResponseCodeBadRequest001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeBadRequest001", 0, async function (done) {
      console.log("-----------------------ResponseCode BAD_REQUEST Test is starting-----------------------");
      try {
        expect(400).assertEqual(http.ResponseCode.BAD_REQUEST);
        console.log("-----------------------ResponseCode BAD_REQUEST Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeBadRequest001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_UNAUTHORIZED_001
     * @tc.name testTelephonyHttpResponseCodeUnauthorized001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeUnauthorized001", 0, async function (done) {
      console.log("-----------------------ResponseCode UNAUTHORIZED Test is starting-----------------------");
      try {
        expect(401).assertEqual(http.ResponseCode.UNAUTHORIZED);
        console.log("-----------------------ResponseCode UNAUTHORIZED Test end-----------------------");
        done();
      } catch (error) {
        console.log("Telephony_Http_ResponseCode_UNAUTHORIZED_0100 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_PAYMENT_REQUIRED_001
     * @tc.name testTelephonyHttpResponseCodePaymentRequest001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodePaymentRequest001", 0, async function (done) {
      console.log("-----------------------ResponseCode PAYMENT_REQUIRED Test is starting-----------------------");
      try {
        expect(402).assertEqual(http.ResponseCode.PAYMENT_REQUIRED);
        console.log("-----------------------ResponseCode PAYMENT_REQUIRED Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodePaymentRequest001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_BAD_METHOD_001
     * @tc.name testTelephonyHttpResponseCodeBadMethod001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeBadMethod001", 0, async function (done) {
      console.log("-----------------------ResponseCode BAD_METHOD Test is starting-----------------------");
      try {
        expect(405).assertEqual(http.ResponseCode.BAD_METHOD);
        console.log("-----------------------ResponseCode BAD_METHOD Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeBadMethod001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_NOT_ACCEPTABLE_001
     * @tc.name testTelephonyHttpResponseCodeNotAcceptable001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeNotAcceptable001", 0, async function (done) {
      console.log("-----------------------ResponseCode NOT_ACCEPTABLE Test is starting-----------------------");
      try {
        expect(406).assertEqual(http.ResponseCode.NOT_ACCEPTABLE);
        console.log("-----------------------ResponseCode NOT_ACCEPTABLE Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeNotAcceptable001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_PROXY_AUTH_001
     * @tc.name testTelephonyHttpResponseCodeProxyAuth001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeProxyAuth001", 0, async function (done) {
      console.log("-----------------------ResponseCode PROXY_AUTH Test is starting-----------------------");
      try {
        expect(407).assertEqual(http.ResponseCode.PROXY_AUTH);
        console.log("-----------------------ResponseCode PROXY_AUTH Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeProxyAuth001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_CLIENT_TIMEOUT_001
     * @tc.name testTelephonyHttpResponseCodeClientTimeout001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeClientTimeout001", 0, async function (done) {
      console.log("-----------------------ResponseCode CLIENT_TIMEOUT Test is starting-----------------------");
      try {
        expect(408).assertEqual(http.ResponseCode.CLIENT_TIMEOUT);
        console.log("-----------------------ResponseCode CLIENT_TIMEOUT Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeClientTimeout001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_LENGTH_REQUIRED_001
     * @tc.name testTelephonyHttpResponseCodeLengthRequired001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeLengthRequired001", 0, async function (done) {
      console.log("-----------------------ResponseCode LENGTH_REQUIRED Test is starting-----------------------");
      try {
        expect(411).assertEqual(http.ResponseCode.LENGTH_REQUIRED);
        console.log("-----------------------ResponseCode LENGTH_REQUIRED Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeLengthRequired001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_PRECON_FAILED_001
     * @tc.name testTelephonyHttpResponseCodePreconFailed001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodePreconFailed001", 0, async function (done) {
      console.log("-----------------------ResponseCode PRECON_FAILED Test is starting-----------------------");
      try {
        expect(412).assertEqual(http.ResponseCode.PRECON_FAILED);
        console.log("-----------------------ResponseCode PRECON_FAILED Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodePreconFailed001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_ENTITY_TOO_LARGE_001
     * @tc.name testTelephonyHttpResponseCodeEntityTooLater001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeEntityTooLater001", 0, async function (done) {
      console.log("-----------------------ResponseCode ENTITY_TOO_LARGE Test is starting-----------------------");
      try {
        expect(413).assertEqual(http.ResponseCode.ENTITY_TOO_LARGE);
        console.log("-----------------------ResponseCode ENTITY_TOO_LARGE Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeEntityTooLater001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_ENTITY_TOO_LARGE_001
     * @tc.name testTelephonyHttpResponseCodeReqTooLong001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */


    it("testTelephonyHttpResponseCodeReqTooLong001", 0, async function (done) {
      console.log("-----------------------ResponseCode REQ_TOO_LONG Test is starting-----------------------");
      try {
        expect(414).assertEqual(http.ResponseCode.REQ_TOO_LONG);
        console.log("-----------------------ResponseCode REQ_TOO_LONG Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeReqTooLong001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_UNSUPPORTED_TYPE_001
     * @tc.name testTelephonyHttpResponseCodeUnsupportedType001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */


    it("testTelephonyHttpResponseCodeUnsupportedType001", 0, async function (done) {
      console.log("-----------------------ResponseCode UNSUPPORTED_TYPE Test is starting-----------------------");
      try {
        expect(415).assertEqual(http.ResponseCode.UNSUPPORTED_TYPE);
        console.log("-----------------------ResponseCode UNSUPPORTED_TYPE Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeUnsupportedType001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_INTERNAL_ERROR_001
     * @tc.name testTelephonyHttpResponseCodeInternalError001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */
    it("testTelephonyHttpResponseCodeInternalError001", 0, async function (done) {
      console.log("-----------------------ResponseCode INTERNAL_ERROR Test is starting-----------------------");
      try {
        expect(500).assertEqual(http.ResponseCode.INTERNAL_ERROR);
        console.log("-----------------------ResponseCode INTERNAL_ERROR Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeInternalError001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_NOT_IMPLEMENTED_001
     * @tc.name testTelephonyHttpResponseCodeNotImplemented001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeNotImplemented001", 0, async function (done) {
      console.log("-----------------------ResponseCode NOT_IMPLEMENTED Test is starting-----------------------");
      try {
        expect(501).assertEqual(http.ResponseCode.NOT_IMPLEMENTED);
        console.log("-----------------------ResponseCode NOT_IMPLEMENTED Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeNotImplemented001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_BAD_GATEWAY_001
     * @tc.name testTelephonyHttpResponseCodeBadGateway001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeBadGateway001", 0, async function (done) {
      console.log("-----------------------ResponseCode BAD_GATEWAY Test is starting-----------------------");
      try {
        expect(502).assertEqual(http.ResponseCode.BAD_GATEWAY);
        console.log("-----------------------ResponseCode BAD_GATEWAY Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeBadGateway001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_GATEWAY_TIMEOUT_001
     * @tc.name testTelephonyHttpResponseCodeGatewayTimeout001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeGatewayTimeout001", 0, async function (done) {
      console.log("-----------------------ResponseCode GATEWAY_TIMEOUT Test is starting-----------------------");
      try {
        expect(504).assertEqual(http.ResponseCode.GATEWAY_TIMEOUT);
        console.log("-----------------------ResponseCode GATEWAY_TIMEOUT Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeGatewayTimeout001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_VERSION_001
      * @tc.name testTelephonyHttpResponseCodeVersion001
      * @tc.desc Test Test ResponseCode property.
      * @tc.size:  MediumTest
      * @tc.type:  Enum
      * @tc.level: level 0
      */

    it("testTelephonyHttpResponseCodeVersion001", 0, async function (done) {
      console.log("-----------------------ResponseCode VERSION Test is starting-----------------------");
      try {
        expect(505).assertEqual(http.ResponseCode.VERSION);
        console.log("-----------------------ResponseCode VERSION Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeVersion001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_CREATED_001
     * @tc.name testTelephonyHttpResponseCodeCreated001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeCreated001", 0, async function (done) {
      console.log("-----------------------ResponseCode CREATED Test is starting-----------------------");
      try {
        expect(201).assertEqual(http.ResponseCode.CREATED);
        console.log("-----------------------ResponseCode CREATED Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeCreated001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
    * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_CREATED_001
    * @tc.name testTelephonyHttpResponseCodeReset001
    * @tc.desc Test Test ResponseCode property.
    * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
    */
    it("testTelephonyHttpResponseCodeReset001", 0, async function (done) {
      console.log("-----------------------ResponseCode RESET Test is starting-----------------------");
      try {
        expect(205).assertEqual(http.ResponseCode.RESET);
        console.log("-----------------------ResponseCode RESET Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeReset001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_PARTIAL_001
     * @tc.name testTelephonyHttpResponseCodePartial001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodePartial001", 0, async function (done) {
      console.log("-----------------------ResponseCode PARTIAL Test is starting-----------------------");
      try {
        expect(206).assertEqual(http.ResponseCode.PARTIAL);
        console.log("-----------------------ResponseCode PARTIAL Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodePartial001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_MOVED_TEMP_001
     * @tc.name testTelephonyHttpResponseCodeMovedTemp001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeMovedTemp001", 0, async function (done) {
      console.log("-----------------------ResponseCode MOVED_TEMP Test is starting-----------------------");
      try {
        expect(302).assertEqual(http.ResponseCode.MOVED_TEMP);
        console.log("-----------------------ResponseCode MOVED_TEMP Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeMovedTemp001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_FORBIDDEN_001
     * @tc.name testTelephonyHttpResponseCodeForbidden001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeForbidden001", 0, async function (done) {
      console.log("-----------------------ResponseCode FORBIDDEN Test is starting-----------------------");
      try {
        expect(403).assertEqual(http.ResponseCode.FORBIDDEN);
        console.log("-----------------------ResponseCode FORBIDDEN Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeForbidden001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_NOT_FOUND_001
     * @tc.name testTelephonyHttpResponseCodeNotFound001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeNotFound001", 0, async function (done) {
      console.log("-----------------------ResponseCode NOT_FOUND Test is starting-----------------------");
      try {
        expect(404).assertEqual(http.ResponseCode.NOT_FOUND);
        console.log("-----------------------ResponseCode NOT_FOUND Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeNotFound001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_CONFLICT_001
     * @tc.name testTelephonyHttpResponseCodeConflict001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeConflict001", 0, async function (done) {
      console.log("-----------------------ResponseCode CONFLICT Test is starting-----------------------");
      try {
        expect(409).assertEqual(http.ResponseCode.CONFLICT);
        console.log("-----------------------ResponseCode CONFLICT Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeConflict001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_GONE_001
     * @tc.name testTelephonyHttpResponseCodeGone001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */

    it("testTelephonyHttpResponseCodeGone001", 0, async function (done) {
      console.log("-----------------------ResponseCode GONE Test is starting-----------------------");
      try {
        expect(410).assertEqual(http.ResponseCode.GONE);
        console.log("-----------------------ResponseCode GONE Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeGone001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTP_RESPONSECODE_UNAVAILABLE_001
     * @tc.name testTelephonyHttpResponseCodeUnavailable001
     * @tc.desc Test Test ResponseCode property.
     * @tc.size:  MediumTest
     * @tc.type:  Enum
     * @tc.level: level 0
     */
    it("testTelephonyHttpResponseCodeUnavailable001", 0, async function (done) {
      console.log("-----------------------ResponseCode UNAVAILABLE Test is starting-----------------------");
      try {
        expect(503).assertEqual(http.ResponseCode.UNAVAILABLE);
        console.log("-----------------------ResponseCode UNAVAILABLE Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpResponseCodeUnavailable001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
  })
};

