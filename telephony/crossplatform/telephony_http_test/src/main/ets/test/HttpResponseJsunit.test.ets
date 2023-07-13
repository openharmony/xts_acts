/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

export default function httpResponseJsunit() {
  describe("HttpResponseJsunitTest", function () {

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESULT_001
     * @tc.name testTelephonyHttpResponseResult001
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResult001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0100';
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
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
          expect(data.result != null).assertTrue();
          console.log("-----------------------HttpResponse result Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResult001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESULT_002
     * @tc.name testTelephonyHttpResponseResult002
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResult002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0100';
      console.log("-----------------------HttpResponse result_01 Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.result != null).assertTrue();
          console.log("-----------------------HttpResponse result_01 Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResult002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESULT_003
     * @tc.name testTelephonyHttpResponseResult003
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResult003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0100';
      console.log("-----------------------HttpResponse result_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.result != null).assertTrue();
          console.log("-----------------------HttpResponse result_02 Test end-----------------------");
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResult003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESULT_004
     * @tc.name testTelephonyHttpResponseResult004
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResult004", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0100';
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
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
          expect(data.result != null).assertTrue();
          console.log("-----------------------HttpResponse result Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResult004 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESULTTYPE_001
     * @tc.name testTelephonyHttpResponseResultType001
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResultType001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0100';
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          expectDataType: http.HttpDataType.STRING
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.resultType == http.HttpDataType.STRING).assertTrue();
          console.log("-----------------------HttpResponse result Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResultType001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESULTTYPE_002
     * @tc.name testTelephonyHttpResponseResultType002
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResultType002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0100';
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          expectDataType: http.HttpDataType.OBJECT
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.resultType == http.HttpDataType.OBJECT).assertTrue();
          console.log("-----------------------HttpResponse result Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResultType002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESULTTYPE_003
     * @tc.name testTelephonyHttpResponseResultType003
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResultType003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0100';
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          expectDataType: http.HttpDataType.ARRAY_BUFFER
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.resultType == http.HttpDataType.ARRAY_BUFFER).assertTrue();
          console.log("-----------------------HttpResponse result Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResultType003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESPONSECODE_001
     * @tc.name testTelephonyHttpResponseResponseCode001
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResponseCode001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0200';
      console.log("-----------------------HttpResponse responseCode Test is starting-----------------------");
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
          expect(data.responseCode != 0).assertTrue();
          console.log("-----------------------HttpResponse responseCode Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResponseCode001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESPONSECODE_002
     * @tc.name testTelephonyHttpResponseResponseCode002
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResponseCode002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0200';
      console.log("-----------------------HttpResponse responseCode_01 Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode != 0).assertTrue();
          console.log("-----------------------HttpResponse responseCode_01 Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResponseCode002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESPONSECODE_003
     * @tc.name testTelephonyHttpResponseResponseCode003
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResponseCode003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0200';
      console.log("-----------------------HttpResponse responseCode_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode != 0).assertTrue();
          console.log("-----------------------HttpResponse responseCode_02 Test end-----------------------");
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResponseCode003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_RESPONSECODE_004
     * @tc.name testTelephonyHttpResponseResponseCode004
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseResponseCode004", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0200';
      console.log("-----------------------HttpResponse responseCode Test is starting-----------------------");
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
          expect(data.responseCode != 0).assertTrue();
          console.log("-----------------------HttpResponse responseCode Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseResponseCode004 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_HEADER_001
     * @tc.name testTelephonyHttpResponseHeader001
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseHeader001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0300';
      console.log("-----------------------HttpResponse header Test is starting-----------------------");
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
          expect(data.header != null).assertTrue();
          console.log("-----------------------header result Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseHeader001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_HEADER_002
     * @tc.name testTelephonyHttpResponseHeader002
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseHeader002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0300';
      console.log("-----------------------HttpResponse header_01 Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.header != null).assertTrue();
          console.log("-----------------------header header_01 Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseHeader002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_HEADER_003
     * @tc.name testTelephonyHttpResponseHeader003
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseHeader003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0300';
      console.log("-----------------------HttpResponse header_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.header != null).assertTrue();
          console.log("-----------------------HttpResponse header_02 Test end-----------------------");
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseHeader003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_HEADER_004
     * @tc.name testTelephonyHttpResponseHeader004
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseHeader004", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0300';
      console.log("-----------------------HttpResponse header Test is starting-----------------------");
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
          expect(data.header != null).assertTrue();
          console.log("-----------------------header result Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseHeader001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_Cookies_001
     * @tc.name testTelephonyHttpResponseCookies001
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseCookies001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0400';
      console.log("-----------------------HttpResponse cookies Test is starting-----------------------");
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
          expect(data.cookies != null).assertTrue();
          console.log("-----------------------HttpResponse cookies Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseCookies001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_Cookies_002
     * @tc.name testTelephonyHttpResponseCookies002
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseCookies002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0400';
      console.log("-----------------------HttpResponse cookies_01 Test is starting-----------------------");
      try {
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.cookies != null).assertTrue();
          console.log("-----------------------HttpResponse cookies_01 Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseCookies002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_Cookies_003
     * @tc.name testTelephonyHttpResponseCookies003
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseCookies003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0400';
      console.log("-----------------------HttpResponse cookies_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.cookies != null).assertTrue();
          console.log("-----------------------HttpResponse cookies_02 Test end-----------------------");
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseCookies003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPRESPONSE_Cookies_004
     * @tc.name testTelephonyHttpResponseCookies004
     * @tc.desc Test Test HttpResponse property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpResponseCookies004", 0, async function (done) {
      var casename = 'Telephony_Http_HttpResponse_0400';
      console.log("-----------------------HttpResponse cookies Test is starting-----------------------");
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
          expect(data.cookies != null).assertTrue();
          console.log("-----------------------HttpResponse cookies Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpResponseCookies001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
  })
};

