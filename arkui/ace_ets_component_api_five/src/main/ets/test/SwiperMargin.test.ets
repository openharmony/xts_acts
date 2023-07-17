/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import router from '@ohos.router'
import {UiDriver, UiComponent, BY, Driver, Component, ON} from '@ohos.UiTest'
export default function SwiperMarginTest() {

  const SUITE = 'SwiperMargin'
  const waitUiReadyMs = 500;
  describe('SwiperMarginTest', function () {

    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/SwiperMargin",
      }
      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("SwiperMargin" == pages.name)) {
          await router.pushUrl(options).then(()=>{
            console.info(`${SUITE} router.pushUrl success`);
          }).catch(err => {
            console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_Swiper_0100
     *tc.name   Set Swiper's nextMargin and prevMargin with negative
     *tc.desc   Set Swiper's nextMargin and prevMargin with negative
     */
    it('ArkUI_Swiper_0100', 0, async function (done) {
      let CASE = 'ArkUI_Swiper_0100'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper1'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);

      expect(obj.$attrs.prevMargin).assertEqual('0.00vp')
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp')
      console.info(`${SUITE} ${CASE} END`);

      done();
    });

    /*
     *tc.number ArkUI_Swiper_0200
     *tc.name   Set Swiper's nextMargin and prevMargin with positive
     *tc.desc   Set Swiper's nextMargin and prevMargin with positive
     */
    it('ArkUI_Swiper_0200', 0, async function (done) {
      let CASE = 'ArkUI_Swiper_0200'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper2'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);

      expect(obj.$attrs.prevMargin).assertEqual('10.00vp')
      expect(obj.$attrs.nextMargin).assertEqual('10.00vp')
      console.info(`${SUITE} ${CASE} END`);

      done();
    });

    /*
     *tc.number ArkUI_Swiper_0300
     *tc.name   Set Swiper's nextMargin and prevMargin with string
     *tc.desc   Set Swiper's nextMargin and prevMargin with string
     */
    it('ArkUI_Swiper_0300', 0, async function (done) {
      let CASE = 'ArkUI_Swiper_0300'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper3'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);

      expect(obj.$attrs.prevMargin).assertEqual('11.00vp')
      expect(obj.$attrs.nextMargin).assertEqual('11.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Swiper_0400
     *tc.name   Set Swiper's nextMargin and prevMargin with Resource
     *tc.desc   Set Swiper's nextMargin and prevMargin with Resource
     */
    it('ArkUI_Swiper_0400', 0, async function (done) {
      let CASE = 'ArkUI_Swiper_0400'
      console.info(`${SUITE} ${CASE} START`);

      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      let baseKey = 'SwiperMargin_Swiper4'
      let strJson = getInspectorByKey(baseKey);
      let obj = JSON.parse(strJson);

      expect(obj.$attrs.prevMargin).assertEqual('12.00vp')
      expect(obj.$attrs.nextMargin).assertEqual('12.00vp')
      console.info(`${SUITE} ${CASE} END`);
      done();
    });


  })
}
