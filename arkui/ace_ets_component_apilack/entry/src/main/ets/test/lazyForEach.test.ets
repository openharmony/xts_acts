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

import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"
import Utils from './Utils.ets'

export default function lazyForEachOnDataAddJsunit() {
  describe('lazyForEachOnDataAddTest', function () {
    beforeAll(async function (done) {
      console.info("flex beforeEach start");
      let options = {
        uri: 'pages/lazyForEach',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get lazyForEach state success " + JSON.stringify(pages));
        if (!("lazyForEach" == pages.name)) {
          console.info("get lazyForEach state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push lazyForEach page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push lazyForEach page error: " + err);
      }
      done()
    });

    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("lazyForEachOnDataAdd after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testlazyForEachOnDataAdd0001
     * @tc.desic         acelazyForEachOnDataAddEtsTest0001
     */
    it('testlazyForEachOnDataAdd0001', 0, async function (done) {
      console.info('lazyForEachOnDataAdd testlazyForEachOnDataAdd0001 START');
      await Utils.sleep(2000);
      let strJson = getInspectorByKey('onDataAddText');
      console.info("[testlazyForEachOnDataAdd0001] component width strJson:" + strJson);
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.width).assertEqual("300.00vp");
      console.info("[testlazyForEachOnDataAdd0001] width value :" + obj.$attrs.width);
      done();
    });
  })
}
