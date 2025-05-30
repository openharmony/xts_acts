/**
 * Copyright (c) 2021-2023 Huawei Device Co., Ltd.
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

import { describe, expect, it, afterEach, afterAll, Level, Size, TestType }from '@ohos/hypium';
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
let httpRequest = http.createHttp();
let url = "http://www.baidu.com";
let pwd = 13456;

let httpRequestOptions_fileData:http.HttpRequestOptions = {
  method:http.RequestMethod.POST,
  header: { "Content-type":"multipart/form-data"},
  multiFormDataList:[
    {
      name: "Part",
      contentType: 'file',
      data: "'----BEGIN CERTIFICATE----\n" +
        "MIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G\n" +
        "A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNp\n" +
        "Z24xEzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4\n" +
        "MTAwMDAwWjBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEG\n" +
        "A1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjCCASIwDQYJKoZI\n" +
        "hvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aEyiie/QV2EcWtiHL8\n" +
        "RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5uzsT\n" +
        "gHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmm\n" +
        "KPZpO/bLyCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zd\n" +
        "QQ4gOsC0p6Hpsk+QLjJg6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZ\n" +
        "XriX7613t2Saer9fwRPvm2L7DWzgVGkWqQPabumDk3F2xmmFghcCAwEAAaNCMEAw\n" +
        "DgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFI/wS3+o\n" +
        "LkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+yAzv95ZU\n" +
        "RUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMp\n" +
        "jjM5RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK\n" +
        "6fBdRoyV3XpYKBovHd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQX\n" +
        "mcIfeg7jLQitChws/zyrVQ4PkX4268NXSb7hLi18YIvDQVETI53O9zJrlAGomecs\n" +
        "Mx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o2HLO02JQZR7rkpeDMdmztcpH\n" +
        "WD9f\n" +
        "-----END CERTIFICATE-----'",
      remoteFileName: 'ca.pem'
    }
  ]}
let httpRequestOptions_form:http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data"},
  multiFormDataList: [
    {
      name: "Part",
      contentType:'form',
      data: {
        name:'xyy',
        password:pwd
      }
    }
  ]}
let httpRequestOptions:http.HttpRequestOptions = {
  method: http.RequestMethod.POST,
  header: { "Content-type": "multipart/form-data" },
  multiFormDataList: [
    {
      name: "Part1",
      contentType: 'string',
      data:'textyyyy',
      filePath:'./test.txt'

    }
  ]}

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
}

function expectTrue(data : boolean){
    try {
        expect(data).assertTrue();
    } catch (err){
        console.info('assertion failure');    
    }
};

export default function NetworkManagerMulticastHTTP2Test() {
  afterAll(async () =>{
    console.log('NetworkManagerMulticastHTTPTest afterAll start');
    console.log('NetworkManagerMulticastHTTPTest afterAll end');
  })
  describe("NetworkManagerMulticastHTTP2Test", () => {
    //request:
    /**
     * @tc.number: SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0100
     * @tc.name: HTTP::request
     * @tc.desc: Test request property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0100";
      httpRequest.request(url, httpRequestOptions_fileData).then((data) => {
        console.log(`${caseName} request failed, err: ${JSON.stringify(data)}`);
        expectTrue(data.responseCode == 200);
        done();
      }).catch((err: BusinessError) => {
        console.log(`${caseName} request success, data: ${JSON.stringify(err)}`);
        expectFalse();
        done();
      })
    })
    /**
     * @tc.number: SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0200
     * @tc.name: HTTP::request
     * @tc.desc: Test request property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0200";
      httpRequest.request(url,httpRequestOptions_form).then((data) => {
          console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
          expectTrue(data.responseCode == 200);
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
          expectFalse();
          done();
      })
    })
    /**
     * @tc.number: SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0300
     * @tc.name: HTTP::request
     * @tc.desc: Test request property.
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = "SUB_Telephony_netstack_Http_Multipart_Xts_Promise_0300";
      httpRequest.request(url,httpRequestOptions).then((data) => {
        console.log(`${caseName} request success, data: ${JSON.stringify(data)}`);
        expectTrue(data.responseCode == 200);
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} request failed, err: ${JSON.stringify(err)}`);
        expectFalse();
        done();
      })
    })
  })
}