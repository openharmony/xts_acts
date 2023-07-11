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
import {describe, it, expect} from '@ohos/hypium';
import http from '@ohos.net.http';

export default function requestMethodJsunit() {
  describe("requestMethodJsunit", function () {

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_OPTIONS_001
     * @tc.name testTelephonyHttpRequestMethodOptions001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodOptions001", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0100';
      console.log("-----------------------HttpRequestMethod_options Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.OPTIONS,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_options Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodOptions001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_OPTIONS_002
     * @tc.name testTelephonyHttpRequestMethodOptions002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodOptions002", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0100';
      console.log("-----------------------HttpRequestMethod_options_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.OPTIONS,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_options_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodOptions002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_OPTIONS_003
     * @tc.name testTelephonyHttpRequestMethodOptions003
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodOptions003", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0100';
      console.log("-----------------------HttpRequestMethod_options Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.OPTIONS,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://app.4399.cn/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_options Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodOptions001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_GET_001
     * @tc.name testTelephonyHttpRequestMethodGet001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodGet001", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0200"
      console.log("-----------------------HttpRequestMethod_GET Test is starting-----------------------");
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
          console.log("-----------------------HttpRequestMethod_GET Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodGet001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_GET_002
     * @tc.name testTelephonyHttpRequestMethodGet002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodGet002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0200"
      console.log("-----------------------HttpRequestMethod_GET_01 Test is starting-----------------------");
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
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_GET_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodGet002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_GET_003
     * @tc.name testTelephonyHttpRequestMethodGet003
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodGet003", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0200"
      console.log("-----------------------HttpRequestMethod_GET Test is starting-----------------------");
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
          console.log("-----------------------HttpRequestMethod_GET Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodGet001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_POST_001
     * @tc.name testTelephonyHttpRequestMethodPost001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodPost001", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0300"
      console.log("-----------------------HttpRequestMethod_POST Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.POST,
          extraData: {
            //tn=albumsdetail&word=渐变风格插画&fr=albumslist&album_tab=设计素材&album_id=409&rn=30
            tn: "albumsdetail",
            work: "渐变风格插画",
            fr: "albumslist",
            album_tab: "设计素材",
            album_id: "409",
            rn: "30"
          },
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_POST Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodPost001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_POST_002
     * @tc.name testTelephonyHttpRequestMethodPost002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodPost002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0300"
      console.log("-----------------------HttpRequestMethod_POST_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.POST,
          extraData: {
            //tn=albumsdetail&word=渐变风格插画&fr=albumslist&album_tab=设计素材&album_id=409&rn=30
            tn: "albumsdetail",
            work: "渐变风格插画",
            fr: "albumslist",
            album_tab: "设计素材",
            album_id: "409",
            rn: "30"
          },
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_POST_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodPost002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_TRACE_001
     * @tc.name testTelephonyHttpRequestMenthodTrace001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodTrace001", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0400"
      console.log("-----------------------HttpRequestMethod_TRACE Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.TRACE,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_TRACE Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodTrace001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_TRACE_002
     * @tc.name testTelephonyHttpRequestMethodTrace002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodTrace002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0400"
      console.log("-----------------------HttpRequestMethod_TRACE_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.TRACE,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_TRACE_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodTrace002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });



    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_PUT_001
     * @tc.name testTelephonyHttpRequestMethodPut001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodPut001", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0500"
      console.log("-----------------------HttpRequestMethod_PUT Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.PUT,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        if (httpRequestOptions.method == http.RequestMethod.PUT) {
          done();
          return;
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_PUT Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodPut001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_PUT_002
     * @tc.name testTelephonyHttpRequestMethodPut002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodPut002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0500"
      console.log("-----------------------HttpRequestMethod_PUT_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.PUT,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        if (httpRequestOptions.method == http.RequestMethod.PUT) {
          done();
          return;
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_PUT_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodPut002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_PUT_003
     * @tc.name testTelephonyHttpRequestMethodPut003
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodPut003", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0500"
      console.log("-----------------------HttpRequestMethod_PUT Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.PUT,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        if (httpRequestOptions.method == http.RequestMethod.PUT) {
          done();
          return;
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://app.4399.cn/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_PUT Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodPut003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_HEAD_001
     * @tc.name testTelephonyHttpRequestMethodHead001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodHead001", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0600';
      console.log("-----------------------HttpRequestMethod_head Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.HEAD,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_head Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodHead001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_HEAD_002
     * @tc.name testTelephonyHttpRequestMethodHead002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestMethodHead002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0500"
      console.log("-----------------------HttpRequestMethod_HEAD_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.HEAD,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_HEAD_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodHead002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_HEAD_003
     * @tc.name testTelephonyHttpRequestMethodHead003
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodHead003", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0600';
      console.log("-----------------------HttpRequestMethod_head Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.HEAD,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://app.4399.cn/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_head Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodHead003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_DELETE_001
     * @tc.name testTelephonyHttpRequestMethodDelete001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodDelete001", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0600';
      console.log("-----------------------HttpRequestMethod_DELETE Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.DELETE,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_DELETE Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodDelete001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_DELETE_002
     * @tc.name testTelephonyHttpRequestMethodDelete002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestMethodDelete002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0500"
      console.log("-----------------------HttpRequestMethod_DELETE_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.DELETE,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_DELETE_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodDelete002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_DELETE_003
     * @tc.name testTelephonyHttpRequestMethodDelete003
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */

    it("testTelephonyHttpRequestMethodDelete003", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0600';
      console.log("-----------------------HttpRequestMethod_DELETE Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.DELETE,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://app.4399.cn/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_DELETE Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodDelete003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_CONNECT_001
     * @tc.name testTelephonyHttpRequestMethodConnect001
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestMethodConnect001", 0, async function (done) {
      var casename = 'Telephony_http_HttpRequestMethod_0600';
      console.log("-----------------------HttpRequestMethod_CONNECT Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.CONNECT,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_CONNECT Test end-----------------------");
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodConnect001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTMETHOD_CONNECT_002
     * @tc.name testTelephonyHttpRequestMethodConnect002
     * @tc.desc Test Test HttpRequestMethod property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestMethodConnect002", 0, async function (done) {
      var casename = "Telephony_http_HttpRequestMethod_0500"
      console.log("-----------------------HttpRequestMethod_CONNECT_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.CONNECT,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestMethod_CONNECT_01 Test end-----------------------");
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestMethodConnect002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });
  })
};

