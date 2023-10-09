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
import { describe, expect, it } from '@ohos/hypium'

export default function Telephony_NETSTACK_HTTPTest() {

    describe('Telephony_NETSTACK_HTTPTest', function () {

        /**
         * @tc.number Telephony_NETSTACK_HttpTestHeader_0100
         * @tc.name 返回Header
         * @tc.desc Function test`
         */

		 it('Telephony_NETSTACK_HttpTestHeader_0100', 0, function (done) {
		  let http = netHttp.createHttp();
		  http.request("https://httpbin.org/get" ,{
			method: netHttp.RequestMethod.GET,
			extraData: "MineMine",
			header: { 'Content-Type': 'application/json' }
		  }).then(function (data) {
			http.destroy();
			expect(data.responseCode === netHttp.ResponseCode.OK || data.responseCode > 500).assertTrue();
			console.info("Telephony_NETSTACK_HttpTestHeader_0100" + JSON.stringify(data.result));
			if (data.responseCode === netHttp.ResponseCode.OK) {
			  expect(data.result.toString().search("Content-Type") != -1).assertTrue();
			  expect(data.result.toString().search("application/json") != -1).assertTrue();
			}
			done()
		  });
		});

        
    });
}