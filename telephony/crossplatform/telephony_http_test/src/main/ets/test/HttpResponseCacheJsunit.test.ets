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
  describe("HttpResponseCacheJsunitTest", function () {

    /**
     *@tc.number    : TEST_TELEPHONYHTTPRESPONSECACHESIZE_001
     *@tc.name      : testTelephonyHttpResponseCacheSize001
     *@tc.desc      : Test HttpResponseCache method: flush:callback.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it("testTelephonyHttpResponseCacheSize001", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'telephonyHttpResponseCacheSize_0001';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache(1*1024*1024);
            httpResponseCache.flush(err => {
              try {
                if (err) {
                  console.info(caseName + ' flush fail: ' + err);
                  expect().assertFail();
                } else {
                  expect(true).assertTrue();
                }
                done();
              } catch (err) {
                console.info(caseName + ' meet error: ' + err);
                done();
              }
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log(caseName + " : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });

    /**
     *@tc.number    : TEST_TELEPHONYHTTPRESPONSECACHESIZE_002
     *@tc.name      : testTelephonyHttpResponseCacheSize002
     *@tc.desc      : Test HttpResponseCache method: flush:callback.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it("testTelephonyHttpResponseCacheSize002", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'telephonyHttpResponseCacheSize_0002';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache(5*1024*1024);
            httpResponseCache.flush(err => {
              try {
                if (err) {
                  console.info(caseName + ' flush fail: ' + err);
                  expect().assertFail();
                } else {
                  expect(true).assertTrue();
                }
                done();
              } catch (err) {
                console.info(caseName + ' meet error: ' + err);
                done();
              }
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log(caseName + " : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });

    /**
     *@tc.number    : TEST_TELEPHONYHTTPRESPONSECACHESIZE_003
     *@tc.name      : testTelephonyHttpResponseCacheSize003
     *@tc.desc      : Test HttpResponseCache method: flush:callback.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
     it("testTelephonyHttpResponseCacheSize003", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'telephonyHttpResponseCacheSize_0003';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache(10*1024*1024);
            httpResponseCache.flush(err => {
              try {
                if (err) {
                  console.info(caseName + ' flush fail: ' + err);
                  expect().assertFail();
                } else {
                  expect(true).assertTrue();
                }
                done();
              } catch (err) {
                console.info(caseName + ' meet error: ' + err);
                done();
              }
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log(caseName + " : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });

    /**
     *@tc.number    : TEST_TELEPHONY_HTTPRESPONSECACHEFLUSH_001
     *@tc.name      : testTelephonyHttpResponseCacheFlush001
     *@tc.desc      : Test HttpResponseCache method: flush:callback.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testTelephonyHttpResponseCacheFlush001", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'telephonyHttpResponseCacheFlush_0001';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush(err => {
              try {
                if (err) {
                  console.info(caseName + ' flush fail: ' + err);
                  expect().assertFail();
                } else {
                  expect(true).assertTrue();
                }
                done();
              } catch (err) {
                console.info(caseName + ' meet error: ' + err);
                done();
              }
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log(caseName + " : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });


    /**
     *@tc.number    : TEST_TELEPHONY_HTTPRESPONSECACHEFLUSH_002
     *@tc.name      : testTelephonyHttpResponseCacheFlush002
     *@tc.desc      : Test HttpResponseCache method: flush:callback.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testTelephonyHttpResponseCacheFlush002", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'telephonyHttpResponseCacheFlush_0001';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://app.4399.cn/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush(err => {
              try {
                if (err) {
                  console.info(caseName + ' flush fail: ' + err);
                  expect().assertFail();
                } else {
                  expect(true).assertTrue();
                }
                done();
              } catch (err) {
                console.info(caseName + ' meet error: ' + err);
                done();
              }
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log(caseName + " : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });

    /**
     *@tc.number    : TEST_TELEPHONY_HTTP_RESPONSE_CACHE_FLUSH_003
     *@tc.name      : testTelephonyHttpResponseCacheFlush_003
     *@tc.desc      : Test HttpResponseCache method: flush:promise.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testTelephonyHttpResponseCacheFlush_003", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'telephonyHttpResponseCacheFlush_0002';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();

            const httpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush().then(() => {
              expect(true).assertTrue();
              done();
            }).catch(err => {
              console.info(caseName + "err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log("Telephony_http_HttpRequestOptions_method_0200 : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });

    /**
     *@tc.number    : TEST_TELEPHONY_HTTP_RESPONSE_CACHE_FLUSH_004
     *@tc.name      : testTelephonyHttpResponseCacheFlush_004
     *@tc.desc      : Test HttpResponseCache method: flush:promise.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testTelephonyHttpResponseCacheFlush_004", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'telephonyHttpResponseCacheFlush_0002';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://app.4399.cn/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache();
            httpResponseCache.flush().then(() => {
              expect(true).assertTrue();
              done();
            }).catch(err => {
              console.info(caseName + "err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log("Telephony_http_HttpRequestOptions_method_0200 : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });




    /**
     *@tc.number    : TELEPHONY_HTTP_RESPONSE_CACHE_DELETE_001
     *@tc.name      : testTelephonyHttpResponseCacheDelete001
     *@tc.desc      : Test HttpResponseCache method: delete:callback.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testTelephonyHttpResponseCacheDelete001", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'testTelephonyHttpResponseCacheDelete001';
      try {
        console.log("-----------------------HttpRequestOptions_method_01 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache();
            httpResponseCache.delete(err => {
              try {
                if (err) {
                  console.info(caseName + ' delete fail: ' + err);
                  expect().assertFail();
                } else {
                  expect(true).assertTrue();
                }
                done();
              } catch (err) {
                console.info(caseName + ' meet error: ' + err);
                done();
              }
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log("testTelephonyHttpResponseCacheDelete001 : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });

    /**
     *@tc.number    : TELEPHONY_HTTP_RESPONSE_CACHE_DELETE_002
     *@tc.name      : testTelephonyHttpResponseCacheDelete002
     *@tc.desc      : Test HttpResponseCache method: delete:promise.
     *@tc.size      : MediumTest
     *@tc.type      : Function
     *@tc.level     : Level 2
     */
    it("testTelephonyHttpResponseCacheDelete002", 0, async function (done) {
      console.log("-----------------------HttpResponse result Test is starting-----------------------");
      var caseName = 'testTelephonyHttpResponseCacheDelete002';
      try {
        console.log("-----------------------telephonyHttpResponseCacheDelete_0002 Test is starting-----------------------");
        try {
          let httpRequestOptions = {
            method: http.RequestMethod.GET,
            extraData: null,
            header: "content-type': 'application/json",
            readTimeout: 60000,
            connectTimeout: 60000,
            usingCache: true
          }
          var httpRequest = http.createHttp();
          httpRequest.request("https://www.baidu.com/", httpRequestOptions).then(data => {
            console.log(caseName + JSON.stringify(data));
            expect(data.responseCode == 200).assertTrue();
            const httpResponseCache = http.createHttpResponseCache();
            httpResponseCache.delete().then(() => {
              expect(true).assertTrue();
              done();
            }).catch(err => {
              console.info(caseName + "err: " + JSON.stringify(err));
              expect().assertFail();
              done();
            });
          }).catch(error => {
            console.info(caseName + "errocode" + JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });

        } catch (error) {
          console.log("telephonyHttpResponseCacheDelete_0001 : error = " + error);
          expect(false).assertTrue();
          done();
        }

      } catch (error) {
        console.log(caseName + " : error = " + error);
        expect().assertFail();
        done();
      }
      httpRequest.destroy();
    });

  })
};

