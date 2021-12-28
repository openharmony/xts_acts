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

export default function blankJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('BlankTest', function () {
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0630
     * @tc.name      testBlankGetInspectorByKey010
     * @tc.desc      aceEtsTest
     */
    it('BlankGetInspectorByKey', 0, async function (done) {
      console.info('testGetInspectorByKey START');
      let options = {
        uri: 'pages/Blank',
      }
      try {
        let result = await router.push(options)
        console.info("push blank page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push blan page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('blank');
      let obj = JSON.parse(strJson);
      console.info("cd blank component obj is: " + JSON.stringify(obj));
      console.log("cd blank type" + JSON.stringify(obj.$type));
      console.log("cd blank min" + JSON.stringify(obj.$attrs.min));
      console.log("cd blank color" + JSON.stringify(obj.$attrs.color));
      expect(obj.$type).assertEqual('Blank')
      expect(obj.$attrs.min).assertEqual('100.000000vp')
      console.info('cd BlankGetInspectorByKey END');
      done();
    });

  })
}
