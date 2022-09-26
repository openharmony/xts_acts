// @ts-nocheck
/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index";
import Utils from './Utils.ets'

export default function basicJsunit() {
  describe('basicJsunit', function () {
    let businessCallback: AsyncCallback<string, Array<number>> = (error, data) => {
      console.info("businessCallback error data is" + JSON.stringify(error.data));
      expect(JSON.stringify(error.data)).assertEqual("[1,2]");
    }

    function businessErrorTest(asyncCallback: AsyncCallback<string, Array<number>>): void {
      let businessError: BusinessError<Array<number>> = {
        code: 1,
        data: [1,2]
      };
      businessCallback(businessError, "businessErrorCallback");
    }

    let asyncCallback: AsyncCallback<string, Array<number>> = (error, data) => {
      console.info("asyncCallback error data is" + error.data);
      expect(error.data).assertEqual(EdgeEffect.Fade);
    }

    function asyncCallbackTest(asyncCallback: AsyncCallback<string, EdgeEffect>): void {
      let businessError: BusinessError<EdgeEffect> = {
        code: 1,
        data: EdgeEffect.Fade
      };
      asyncCallback(businessError, "asyncCallback");
    }

    beforeEach(async function (done) {
      console.info("basicTest beforeEach start");
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("basicTest after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testAsyncCallbackE0001
     * @tc.desic        aceAsyncCallbackEEtsTest0001
     */
    it('testAsyncCallbackE0001', 0, async function (done) {
      console.info('basicTest testAsyncCallbackE0001 START');
      await Utils.sleep(2000);
      asyncCallbackTest(asyncCallback);
      done();
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testBusinessError0002
     * @tc.desic        aceBusinessErrorEtsTest0001
     */
    it('testBusinessError0002', 0, async function (done) {
      console.info('basicTest testBusinessError0002 START');
      await Utils.sleep(2000);
      businessErrorTest(businessCallback);
      done();
    });
  });
}