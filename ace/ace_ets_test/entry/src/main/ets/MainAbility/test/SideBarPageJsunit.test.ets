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

export default function SideBarPageJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('SideBarPageTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/SideBarPage',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get SideBarPage state success " + JSON.stringify(pages));
        if (!("SideBarPage" == pages.name)) {
          console.info("get SideBarPage state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push SideBarPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SideBarPage page error " + JSON.stringify(result));
      }
      await sleep(2)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("SideBarPage after each called");
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0350
     * @tc.name      gridItemTest001
     * @tc.desc      aceEtsTest
     */
    it('sideBarPageTest001', 0, async function (done) {
      console.info('sideBarPageTest001 START');
      let strJson = getInspectorByKey('sideBar');
      let obj = JSON.parse(strJson);
      console.log(JSON.stringify(obj))
      console.log(JSON.stringify(obj.$attrs.controlButton))
      let controlButton = JSON.parse(obj.$attrs.controlButton)

      console.log(JSON.stringify(controlButton.controlButton.icon.shown))
      console.log(JSON.stringify(controlButton.controlButton.icon.hidden))
      console.log(JSON.stringify(controlButton.controlButton.icon.switching))
      expect(controlButton.controlButton.icon.shown).assertEqual('显示')
      expect(controlButton.controlButton.icon.hidden).assertEqual('隐藏')
      expect(controlButton.controlButton.icon.switching).assertEqual('过程')
//      expect(obj.$attrs.style.scaleWidth).assertEqual('5.00vp')

      console.info('sideBarPageTest001 END');
      done();
    });




  })
}
