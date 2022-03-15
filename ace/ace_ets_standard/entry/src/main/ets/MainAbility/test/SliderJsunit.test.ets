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

export default function sliderJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('SliderTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'pages/Slider',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Slider state success " + JSON.stringify(pages));
        if (!("Slider" == pages.name)) {
          console.info("get Slider state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push Slider page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Slider page error " + JSON.stringify(result));
      }
      await sleep(2)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("Slider after each called");
    });
    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_1060
     * @tc.name      testGetSliderAttr010
     * @tc.desc      aceEtsTest
     */
    it('testGetSliderAttr010', 0, async function (done) {
      console.info('testGetSliderAttr1 START');
      let strJson = getInspectorByKey('slider1');
      let obj = JSON.parse(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      console.info("component obj is  Slider: " + JSON.stringify(obj.$attrs.constructor));
      console.info("slider1 blockColor" + JSON.stringify(obj.$attrs.constructor.blockColor))
      console.info("slider1 selectedColor" + JSON.stringify(obj.$attrs.constructor.selectedColor))
      console.info("slider1 trackColor" + JSON.stringify(obj.$attrs.constructor.trackColor))
      console.info("slider1 showTips" + JSON.stringify(obj.$attrs.constructor.showTips))
      console.info("slider1 showSteps" + JSON.stringify(obj.$attrs.constructor.showSteps))
      console.info("slider1 value" + JSON.stringify(obj.$attrs.constructor.value))
      console.info("slider1 direction" + JSON.stringify(obj.$attrs.constructor.direction))
      console.info("slider1 reverse" + JSON.stringify(obj.$attrs.constructor.reverse))
      console.info("slider1 minLabel" + JSON.stringify(obj.$attrs.constructor.minLabel))
      console.info("slider1 maxLabel" + JSON.stringify(obj.$attrs.constructor.maxLabel))
      console.info("slider1 min" + JSON.stringify(obj.$attrs.constructor.min))
      console.info("slider1 max" + JSON.stringify(obj.$attrs.constructor.max))
      console.info("slider1 step" + JSON.stringify(obj.$attrs.constructor.step))
      console.info("slider1 style" + JSON.stringify(obj.$attrs.constructor.style))
      expect(obj.$attrs.constructor.showTips).assertEqual("false")
      expect(obj.$attrs.constructor.showSteps).assertEqual("false")
      expect(obj.$attrs.constructor.value).assertEqual(40.000000.toFixed(6))
      expect(obj.$attrs.constructor.min).assertEqual(0.000000.toFixed(6))
      expect(obj.$attrs.constructor.max).assertEqual(100.000000.toFixed(6))
      expect(obj.$attrs.constructor.step).assertEqual(1.000000.toFixed(6))
      expect(obj.$attrs.constructor.style).assertEqual("SliderStyle.OutSet")
      console.info('testGetSliderAttr1 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_1070
     * @tc.name      testGetSliderAttr020
     * @tc.desc      aceEtsTest
     */
    it('testGetSliderAttr020', 0, async function (done) {
      console.info('testGetSliderAttr2 START');
      let strJson = getInspectorByKey('slider2');
      let obj = JSON.parse(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      console.info("slider2 showTips" + JSON.stringify(obj.$attrs.constructor.showTips))
      console.info("slider2 showSteps" + JSON.stringify(obj.$attrs.constructor.showSteps))
      console.info("slider1 style" + JSON.stringify(obj.$attrs.constructor.style))
      expect(obj.$attrs.constructor.showTips).assertEqual("true")
      expect(obj.$attrs.constructor.showSteps).assertEqual("true")
      expect(obj.$attrs.constructor.style).assertEqual("SliderStyle.InSet")
      console.info('testGetSliderAttr2 END');
      done();
    });
  })
}
