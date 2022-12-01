/**
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import netHttp from '@ohos.net.http';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function Telephony_NETSTACK_HTTPTest() {

describe('Telephony_NETSTACK_HTTPTest',function(){

    /**
     * @tc.number Telephony_NETSTACK_HttpTestBasicGet_0100
     * @tc.name   基本场景，测试能否GET一个网址
     * @tc.desc   Function test`
     */

    it('Telephony_NETSTACK_HttpTestBasicGet_0100', 0, function(done){
        let http = netHttp.createHttp()
        http.request("https://httpbin.org/anything").then(function(data){
            expect(data.responseCode === netHttp.ResponseCode.OK).assertTrue();
            done();
        });
    });

    /**
     * @tc.number Telephony_NETSTACK_HttpTestUserAgent_0100
     * @tc.name   返回用户代理
     * @tc.desc   Function test`
     */

    it('Telephony_NETSTACK_HttpTestUserAgent_0100', 0, function(done){
        let http = netHttp.createHttp()
        http.request("https://httpbin.org/user-agent").then(function(data){
            expect(data.responseCode === netHttp.ResponseCode.OK).assertTrue();
            console.info(JSON.stringify(data));
            expect(JSON.parse(data.result)["user-agent"] === "libcurl-agent/1.0").assertTrue();
            done();
        });
    });

    /**
     * @tc.number Telephony_NETSTACK_HttpTestHeader_0100
     * @tc.name   返回Header
     * @tc.desc   Function test`
     */

    it('Telephony_NETSTACK_HttpTestHeader_0100', 0, function(done){
        let http = netHttp.createHttp();
        http.request("https://httpbin.org/headers").then(function(data){
            expect(data.responseCode === netHttp.ResponseCode.OK).assertTrue()
            console.info("NETSTACK ####" + JSON.stringify(JSON.parse(data.result)))
            expect(JSON.parse(data.result)["headers"]["Content-Type"] === "application/json").assertTrue()
            done()
        });
    });

    /**
     * @tc.number Telephony_NETSTACK_HttpTestPost
     * @tc.name   返回post内容
     * @tc.desc   Function test`
     */

    it('Telephony_NETSTACK_HttpTestPost_0100', 0, function(done){
        let http = netHttp.createHttp()
        http.request("https://httpbin.org/post" ,{
            method : netHttp.RequestMethod.POST,
            extraData : "MineMine"
        }).then(function(data){
            expect(data.responseCode === netHttp.ResponseCode.OK).assertTrue()
            expect(JSON.parse(data.result)["data"] === "MineMine").assertTrue()
            done();
        });
    });

    /**
     * @tc.number Telephony_NETSTACK_HttpTestPUT
     * @tc.name   返回put内容
     * @tc.desc   Function test`
     */

    it('Telephony_NETSTACK_HttpTestPut_0100', 0, function(done){
        let http = netHttp.createHttp()
        http.request("https://httpbin.org/put" ,{
            method : netHttp.RequestMethod.PUT,
            extraData : "MineMine"
        }).then(function(data){
            expect(data.responseCode === netHttp.ResponseCode.OK).assertTrue()
            expect(JSON.parse(data.result)["data"] === "MineMine").assertTrue()
            done();
        });
    });

    /**
     * @tc.number Telephony_NETSTACK_HttpTestCookies
     * @tc.name   返回Cookies内容
     * @tc.desc   Function test`
     */

    it('Telephony_NETSTACK_HttpTestCookies_0100', 0, function(done){
        let http = netHttp.createHttp()
        http.request("https://httpbin.org/cookies/set/name/value").then(function(data){
            expect(data.responseCode === netHttp.ResponseCode.OK).assertTrue()
            expect(data.cookies !== "").assertTrue()
            done();
        });
    });

    /**
     * @tc.number Telephony_NETSTACK_HttpTestEncode
     * @tc.name   返回Cookies内容
     * @tc.desc   Function test`
     */

    it('Telephony_NETSTACK_HttpTestEncode_0100', 0, function(done){
        let http = netHttp.createHttp()
        http.request("https://httpbin.org/response-headers?key1=val1&key2=val2",{
            extraData : {
                "name1" : "mine1",
                "name2" : "mine2",
            }
        }).then(function(data){
            expect(data.responseCode === netHttp.ResponseCode.OK).assertTrue()
            expect(JSON.parse(data.result)["key1"] === "val1").assertTrue()
            expect(JSON.parse(data.result)["key2"] === "val2").assertTrue()
            expect(JSON.parse(data.result)["name1"] === "mine1").assertTrue()
            expect(JSON.parse(data.result)["name2"] === "mine2").assertTrue()
            done();
        });
    });
});
}
