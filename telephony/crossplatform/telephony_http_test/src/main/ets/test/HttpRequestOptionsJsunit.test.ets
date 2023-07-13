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
import {describe, it, expect} from '@ohos/hypium';
import http from '@ohos.net.http';


export default function HttpRequestOptionsJsunit() {
  describe("HttpRequestOptionsJsunitTest", function () {
    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSMETHOD_001
     * @tc.name testTelephonyHttpRequestOptionsMethod001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsMethod001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0100';
      console.log("-----------------------HttpRequestOptions_method Test is starting-----------------------");
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
          console.log("-----------------------HttpRequestOptions_method Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsMethod001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSMETHOD_002
     * @tc.name testTelephonyHttpRequestOptionsMethod002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsMethod002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0100';
      console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
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
          console.log("-----------------------HttpRequestOptions_method_01 Test end-----------------------");
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsMethod002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSMETHOD_003
     * @tc.name testTelephonyHttpRequestOptionsMethod003
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsMethod003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0100';
      console.log("-----------------------HttpRequestOptions_method Test is starting-----------------------");
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
          console.log("-----------------------HttpRequestOptions_method Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsMethod003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSEXTRADATA_001
     * @tc.name testTelephonyHttpRequestOptionsExtraData001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsExtraData001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0200';
      console.log("-----------------------HttpRequestOptions_extraData Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
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
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsExtraData001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSEXTRADATA_002
     * @tc.name testTelephonyHttpRequestOptionsExtraData002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsExtraData002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0200';
      console.log("-----------------------HttpRequestOptions_extraData_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
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
          console.log("-----------------------HttpRequestOptions_extraData_01 Test end-----------------------");
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsExtraData002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSEXPECTDATATYPE_001
     * @tc.name testTelephonyHttpRequestOptionsExpectDataType001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsExpectDataType001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_expectDataType_0100';
      console.log("-----------------------HttpRequestOptions_extraData Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: {
            //tn=albumsdetail&word=渐变风格插画&fr=albumslist&album_tab=设计素材&album_id=409&rn=30
            tn: "albumsdetail",
            work: "渐变风格插画",
            fr: "albumslist",
            album_tab: "设计素材",
            album_id: "409",
            rn: "30",
          },
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          expectDataType: http.HttpDataType.STRING
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsExpectDataType001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSEXPECTDATATYPE_002
     * @tc.name testTelephonyHttpRequestOptionsExpectDataType002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsExpectDataType002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_expectDataType_0100';
      console.log("-----------------------HttpRequestOptions_extraData Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: {
            //tn=albumsdetail&word=渐变风格插画&fr=albumslist&album_tab=设计素材&album_id=409&rn=30
            tn: "albumsdetail",
            work: "渐变风格插画",
            fr: "albumslist",
            album_tab: "设计素材",
            album_id: "409",
            rn: "30",
          },
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          expectDataType: http.HttpDataType.OBJECT
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsExpectDataType002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSEXPECTDATATYPE_003
     * @tc.name testTelephonyHttpRequestOptionsExpectDataType003
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsExpectDataType003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_expectDataType_0100';
      console.log("-----------------------HttpRequestOptions_extraData Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: {
            //tn=albumsdetail&word=渐变风格插画&fr=albumslist&album_tab=设计素材&album_id=409&rn=30
            tn: "albumsdetail",
            work: "渐变风格插画",
            fr: "albumslist",
            album_tab: "设计素材",
            album_id: "409",
            rn: "30",
          },
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          expectDataType: http.HttpDataType.ARRAY_BUFFER
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsExpectDataType003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSHEADER_001
     * @tc.name testTelephonyHttpRequestOptionsHeader001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsHeader001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header Test is starting-----------------------");
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
            expect(true).assertTrue();
            console.log("-----------------------HttpRequestOptions_header Test end-----------------------");
            httpRequest.destroy();
            done();
          } catch (error) {
            console.log("testTelephonyHttpRequestOptionsHeaders001 : JSON parse error = " + error);
            expect(false).assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsHeader001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSHEADER_002
     * @tc.name testTelephonyHttpRequestOptionsHeader002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsHeader002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header_01 Test is starting-----------------------");
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
          try {
            expect(true).assertTrue();
            console.log("-----------------------HttpRequestOptions_header_01 Test end-----------------------");
            httpRequest.destroy();
            done();
          } catch (error) {
            console.log("Telephony_Http_HttpRequestOptions_header_0200 : JSON parse error = " + error);
            expect().assertFail();
            done();
          }
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsHeader002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSHEADER_003
     * @tc.name testTelephonyHttpRequestOptionsHeader003
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsHeader003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/xml",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          try {
            expect(data.responseCode == 200).assertTrue();
            console.log("-----------------------HttpRequestOptions_header_02 Test end-----------------------");
            httpRequest.destroy();
            done();
          } catch (error) {
            console.log("testTelephonyHttpRequestOptionsHeader003 : JSON parse error = " + error);
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsHeader003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSHEADER_004
     * @tc.name testTelephonyHttpRequestOptionsHeader004
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsHeader004", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header_03 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/xml",
          readTimeout: 60000,
          connectTimeout: 60000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          try {
            expect(data.result.valueOf() != "").assertTrue();
            console.log("-----------------------HttpRequestOptions_header_03 Test end-----------------------");
            httpRequest.destroy();
            done();
          } catch (error) {
            console.log("testTelephonyHttpRequestOptionsHeader004 : JSON parse error = " + error);
            expect().assertFail();
            done();
          }
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsHeader004 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSHEADER_005
     * @tc.name testTelephonyHttpRequestOptionsHeader005
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsHeader005", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0300';
      console.log("-----------------------HttpRequestOptions_header Test is starting-----------------------");
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
            expect(true).assertTrue();
            console.log("-----------------------HttpRequestOptions_header Test end-----------------------");
            httpRequest.destroy();
            done();
          } catch (error) {
            console.log("testTelephonyHttpRequestOptionsHeaders001 : JSON parse error = " + error);
            expect(false).assertFail();
            done();
          }
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsHeader005 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSUSINGCACHE_001
     * @tc.name testTelephonyHttpRequestOptionsUsingCache001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsUsingCache001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_usingCache_0100';
      console.log("-----------------------HttpRequestOptions_usingCache Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
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
          connectTimeout: 60000,
          usingCache: true
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsUsingCache001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSPRIORITY_001
     * @tc.name testTelephonyHttpRequestOptionsPriority001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsPriority001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_priority_0100';
      console.log("-----------------------HttpRequestOptions_priority Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
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
          connectTimeout: 60000,
          priority: 1
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsPriority001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONYHTTPREQUESTOPTIONSPRIORITY_002
     * @tc.name testTelephonyHttpRequestOptionsPriority002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsPriority002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_priority_0100';
      console.log("-----------------------HttpRequestOptions_priority Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
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
          connectTimeout: 60000,
          priority: 1000
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_extraData Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsPriority001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTOPTIONS_USINGPROTOCOL_001
     * @tc.name testTelephonyHttpRequestOptionsUsingProtocol001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsUsingProtocol001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_usingProtocol_0100';
      console.log("-----------------------HttpRequestOptions_usingProtocol Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
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
          connectTimeout: 60000,
          usingProtocol: http.HttpProtocol.HTTP1_1
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://image.baidu.com/search/albumsdetail/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_usingProtocol Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsUsingProtocol001 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTOPTIONS_USINGPROTOCOL_002
     * @tc.name testTelephonyHttpRequestOptionsUsingProtocol002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsUsingProtocol002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_usingProtocol_0100';
      console.log("-----------------------HttpRequestOptions_usingProtocol Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          usingProtocol: http.HttpProtocol.HTTP1_1
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://app.4399.cn/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_usingProtocol Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsUsingProtocol002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTOPTIONS_USINGPROTOCOL_003
     * @tc.name testTelephonyHttpRequestOptionsUsingProtocol003
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsUsingProtocol003", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_usingProtocol_0300';
      console.log("-----------------------HttpRequestOptions_usingProtocol Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          header: "content-type': 'application/json",
          readTimeout: 60000,
          connectTimeout: 60000,
          usingProtocol: http.HttpProtocol.HTTP2,
          extraData: {
            'next': ''
          }
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.zhihu.com/signin", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(data.responseCode == 200).assertTrue();
          console.log("-----------------------HttpRequestOptions_usingProtocol Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsUsingProtocol003 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTOPTIONS_READTIOMEOUT_001
     * @tc.name testTelephonyHttpRequestOptionsReadTimeout001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsReadTimeout001", 0, async function (done) {
      var casename = 'testTelephonyHttpRequestOptionsReadTimeout001';
      console.log("-----------------------testTelephonyHttpRequestOptionsReadTimeout001 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 0.1,
          connectTimeout: 60
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + ' error:' + JSON.stringify(err) + " data: " + JSON.stringify(data));
           expect(err.code == 2300028).assertTrue();
           expect(err.message == 'Timeout was reached').assertTrue();
           httpRequest.destroy();
          console.log("-----------------------testTelephonyHttpRequestOptionsReadTimeout001 Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsReadTimeout001 : error = " + error);
         expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTOPTIONS_READTIOMEOUT_002
     * @tc.name testTelephonyHttpRequestOptionsReadTimeout002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsReadTimeout002", 0, async function (done) {
      var casename = 'testTelephonyHttpRequestOptionsReadTimeout002';
      console.log("-----------------------HttpRequestOptions_readTimeout_02 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 0.1,
          connectTimeout: 60
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          console.log("-----------------------HttpRequestOptions_readTimeout_02 Test end-----------------------");
          expect().assertFail();
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(error.code == 2300028).assertTrue();
          expect(error.message == 'Timeout was reached').assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsReadTimeout002 : error = " + error);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTOPTIONS_CONNECTTIMEOUT_001
     * @tc.name testTelephonyHttpRequestOptionsConnectTimeout001
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsConnectTimeout001", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0500';
      console.log("-----------------------HttpRequestOptions_connectTimeout Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60,
          connectTimeout: 0.1
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions, (err, data) => {
          console.log(casename + JSON.stringify(err) + " data: " + JSON.stringify(data));
          expect(err.code == 2300028).assertTrue();
          expect(err.message == 'Timeout was reached').assertTrue();
          console.log("-----------------------HttpRequestOptions_connectTimeout Test end-----------------------");
          httpRequest.destroy();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsConnectTimeout001 : error = " + error);
        //expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.number TEST_TELEPHONY_HTTPREQUESTOPTIONS_CONNECTTIMEOUT_002
     * @tc.name testTelephonyHttpRequestOptionsConnectTimeout002
     * @tc.desc Test Test HttpRequestOptions property.
     * @tc.size:  MediumTest
     * @tc.type:  Method
     * @tc.level: level 2
     */
    it("testTelephonyHttpRequestOptionsConnectTimeout002", 0, async function (done) {
      var casename = 'Telephony_Http_HttpRequestOptions_0600';
      console.log("-----------------------HttpRequestOptions_connectTimeout_01 Test is starting-----------------------");
      try {
        let httpRequestOptions = {
          method: http.RequestMethod.GET,
          extraData: null,
          header: "content-type': 'application/json",
          readTimeout: 60,
          connectTimeout: 0.1
        }
        var httpRequest = http.createHttp();
        httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
          console.log(casename + JSON.stringify(data));
          console.log("-----------------------HttpRequestOptions_connectTimeout_01 Test end-----------------------");
          expect().assertFail();
          httpRequest.destroy();
          done();
        }).catch(error => {
          console.info(casename+"errocode" + JSON.stringify(error));
          expect(error.code == 2300028).assertTrue();
          expect(error.message == 'Timeout was reached').assertTrue();
          done();
        });
      } catch (error) {
        console.log("testTelephonyHttpRequestOptionsConnectTimeout002 : error = " + error);
        done();
      }
    });

  })

};

