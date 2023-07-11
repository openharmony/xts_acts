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

import { describe, expect, it } from '@ohos/hypium';
import http from '@ohos.net.http';

export default function httpRequestJsunit() {
  describe("HttpRequestJsunitTest", function () {
    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_REQUEST_001
     * @tc.name testTelephonyHttpRequestRequest001
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestRequest001", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0100"
      console.log("-----------------------HttpRequest_request Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequest_request Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestRequest001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_REQUEST_002
     * @tc.name testTelephonyHttpRequestRequest002
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestRequest002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0100"
      console.log("-----------------------HttpRequest_request_01 Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequest_request_01 Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestRequest002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_REQUEST_003
     * @tc.name testTelephonyHttpRequestRequest003
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestRequest003", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0100"
      console.log("-----------------------HttpRequest_request_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        };
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequest_request_02 Test end-----------------------");
          done();
        }).catch(error => {
          console.info('HttpRequest_request_0300 asyncCallback error : ' + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestRequest003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_REQUEST_004
     * @tc.name testTelephonyHttpRequestRequest004
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestRequest004", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0100"
      console.log("-----------------------HttpRequest_request Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://app.4399.cn/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequest_request Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestRequest004 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_REQUEST_005
     * @tc.name testTelephonyHttpRequestRequest005
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestRequest005", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0100"
      console.log("-----------------------HttpRequest_request Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.zhihu.com/signin", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequest_request Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestRequest005 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_DESTROY_001
     * @tc.name testTelephonyHttpRequestDestroy001
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestDestroy001", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0200"
      console.log("-----------------------HttpRequest_destroy Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            httpRequest.destroy();
            expect(true).assertTrue();
            console.log("-----------------------HttpRequest_destroy Test end-----------------------");
            done();
          } catch (error) {
            expect(false).assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestDestroy001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_DESTROY_002
     * @tc.name testTelephonyHttpRequestDestroy002
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestDestroy002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0200"
      console.log("-----------------------HttpRequest_destroy Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://app.4399.cn/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            httpRequest.destroy();
            expect(true).assertTrue();
            console.log("-----------------------HttpRequest_destroy Test end-----------------------");
            done();
          } catch (error) {
            expect(false).assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestDestroy002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUEST_DESTROY_003
     * @tc.name testTelephonyHttpRequestDestroy003
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestDestroy003", 0, async function (done) {
      var casename = "Telephony_http_HttpRequest_0200"
      console.log("-----------------------HttpRequest_destroy Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.zhihu.com/signin", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            httpRequest.destroy();
            expect(true).assertTrue();
            console.log("-----------------------HttpRequest_destroy Test end-----------------------");
            done();
          } catch (error) {
            expect(false).assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestDestroy003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTONHEADERSRECEIVE_001
     * @tc.name testTelephonyHttpRequestOnheadersReceive001
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestOnheadersReceive001", 0, function (done) {
      var casename = "Telephony_http_HttpRequest_0500"
      console.log("-----------------------HttpRequest_on_headersReceive Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.on("headersReceive", (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.log("-----------------------HttpRequest_on_headersReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOnheadersReceive001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOFFHEADERSRECEIVE_001
     * @tc.name testTelephonyHttpRequestOffheadersReceive001
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOffheadersReceive001", 0, function (done) {
      var casename = "Telephony_http_HttpRequest_0600"
      console.log("-----------------------HttpRequest_off_headersReceive Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.off("headersReceive", (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(false).assertTrue();
          console.log("-----------------------HttpRequest_off_headersReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOffheadersReceive001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOFFHEADERSRECEIVE_002
     * @tc.name testTelephonyHttpRequestOffheadersReceive002
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOffheadersReceive002", 0, function (done) {
      console.log("-----------------------HttpRequest_off_headersReceive Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.off('headersReceive');
        expect(true).assertTrue();
        console.log("-----------------------HttpRequest_off_headersReceive_0200 Test end-----------------------");
        done();
      } catch (error) {
        console.log("testTelephonyHttpRequestOffheadersReceive002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTONCEHEADERSRECEIVE_001
     * @tc.name testTelephonyHttpRequestOnceheadersReceive001
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOnceheadersReceive001", 0, function (done) {
      var casename = "Telephony_http_HttpRequest_once_headersReceive_0100"
      console.log("-----------------------HttpRequest_once_headersReceive Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.once('headersReceive', (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.log("-----------------------HttpRequest_on_headersReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOnceheadersReceive001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTONCEHEADERSRECEIVE_002
     * @tc.name testTelephonyHttpRequestOnceheadersReceive002
     * @tc.desc Test Test httprequest property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOnceheadersReceive002", 0, function (done) {
      var casename = "Telephony_http_HttpRequest_once_headersReceive_0100"
      console.log("-----------------------HttpRequest_once_headersReceive Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.once('headersReceive', (data) => {
          console.log(casename + " data: " + JSON.stringify(data));
          expect(true).assertTrue();
          console.log("-----------------------HttpRequest_on_headersReceive Test end-----------------------");
          done();
        });
        httpRequest.request("https://app.4399.cn/", (err, data) => {
          console.log(casename + " data: " + JSON.stringify(data.responseCode) + " err: " + JSON.stringify(err));
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOnceheadersReceive002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
  })
};

