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

export default function hyperlinkJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('hyperLinkTest', function () {

    beforeEach(async function{
      let options = {
        uri: 'pages/HyperLink',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get HyperLink state success " + JSON.stringify(pages));
        if(!("HyperLink" == pages.name)){
          console.info("get HyperLink state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push HyperLink page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HyperLink page error " + JSON.stringify(result));
      }
      await sleep(2)
    });

    afterEach(async function{
      await sleep(3)
      console.info("await 3s ");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0360
     * @tc.name      hyperLinkTest001
     * @tc.desc      aceEtsTest
     */
    it('hyperLinkTest001', 0, async function (done) {
      console.info('++++++++++++++++ Hyperlink TestCase 1 START ++++++++++++++++');
      await sleep(1)
      let strJson = getInspectorByKey('hyperlink1');
      let obj = JSON.parse(strJson);
      expect(obj.$type).assertEqual('Hyperlink')
      console.info("属性值集合: " + JSON.stringify(obj));
      console.log('Hyperlink‘s address is '+JSON.stringify(obj.$attrs.address))
      console.log('Hyperlink‘s content is '+JSON.stringify(obj.$attrs.content))
      expect(obj.$attrs.address).assertEqual('https://developer.harmonyos.com/')
      expect(obj.$attrs.content).assertEqual('Go to the developer website')
      console.info('++++++++++++++++ Hyperlink TestCase 1 End ++++++++++++++++');
      done();
    });
  })
}
