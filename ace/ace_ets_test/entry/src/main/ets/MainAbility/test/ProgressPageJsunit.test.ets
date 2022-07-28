/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function ProgressPageJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('ProgressPageTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/ProgressPage',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get ProgressPage state success " + JSON.stringify(pages));
        if (!("ProgressPage" == pages.name)) {
          console.info("get ProgressPage state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push ProgressPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ProgressPage page error " + JSON.stringify(result));
      }
      await sleep(2)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("ProgressPage after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('progressPageTest001', 0, async function (done) {
      console.info('progressPageTest001 START');
      let strJson = getInspectorByKey('progress');
      let obj = JSON.parse(strJson);
      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.style.scaleCount))
      console.log(JSON.stringify(obj.$attrs.style.scaleWidth))
      expect(obj.$attrs.style.scaleCount).assertEqual('15')
      expect(obj.$attrs.style.scaleWidth).assertEqual('5.00vp')

      console.info('progressPageTest001 END');
      done();
    });

    /**
         * @tc.number    SUB_ACE_BASIC_ETS_API_0350
         * @tc.name      gridItemTest001
         * @tc.desc      aceEtsTest
         */
    it('progressPageTest002', 0, async function (done) {
      console.info('progressPageTest002 START');
      let versionCode = globalThis.versionCode;
      console.log('versionCode = '+versionCode )
      expect(versionCode).assertEqual(1000000)

      console.info('progressPageTest002 END');
      done();
    });


  })
}
