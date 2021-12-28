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

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_1060
     * @tc.name      testGetSliderAttr010
     * @tc.desc      aceEtsTest
     */
    it('testGetSliderAttr010', 0, async function (done) {
      console.info('testGetSliderAttr1 START');
      let options = {
        uri: 'pages/Slider',
      }
      try {
        let result = await router.push(options)
        console.info("push Slider page success " + JSON.stringify(result));
      } catch (err) {
        console.error("push Slider page error " + JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('slider1');
      let obj = JSON.parse(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      console.info("slider1 blockColor" + JSON.stringify(obj.$attrs.blockColor))
      console.info("slider1 selectedColor" + JSON.stringify(obj.$attrs.selectedColor))
      console.info("slider1 trackColor" + JSON.stringify(obj.$attrs.trackColor))
      console.info("slider1 showTips" + JSON.stringify(obj.$attrs.showTips))
      console.info("slider1 showSteps" + JSON.stringify(obj.$attrs.showSteps))
      console.info("slider1 value" + JSON.stringify(obj.$attrs.value))
      console.info("slider1 min" + JSON.stringify(obj.$attrs.min))
      console.info("slider1 max" + JSON.stringify(obj.$attrs.max))
      console.info("slider1 step" + JSON.stringify(obj.$attrs.step))
      console.info("slider1 style" + JSON.stringify(obj.$attrs.style))
      expect(obj.$attrs.blockColor).assertEqual('#FFFF0000')
      expect(obj.$attrs.selectedColor).assertEqual('#FF0000FF')
      expect(obj.$attrs.trackColor).assertEqual('#FF808080')
      expect(obj.$attrs.showTips).assertEqual("false")
      expect(obj.$attrs.showSteps).assertEqual("false")
      expect(obj.$attrs.value).assertEqual(40.000000.toFixed(6))
      expect(obj.$attrs.min).assertEqual(0.000000.toFixed(6))
      expect(obj.$attrs.max).assertEqual(100.000000.toFixed(6))
      expect(obj.$attrs.step).assertEqual(1.000000.toFixed(6))
      expect(obj.$attrs.style).assertEqual("SliderStyle.Outset")
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
      await sleep(1)
      let strJson = getInspectorByKey('slider2');
      let obj = JSON.parse(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      console.info("slider2 showTips" + JSON.stringify(obj.$attrs.showTips))
      console.info("slider2 showSteps" + JSON.stringify(obj.$attrs.showSteps))
      console.info("slider1 style" + JSON.stringify(obj.$attrs.style))
      expect(obj.$attrs.showTips).assertEqual("true")
      expect(obj.$attrs.showSteps).assertEqual("true")
      expect(obj.$attrs.style).assertEqual("SliderStyle.Inset")
      console.info('testGetSliderAttr2 END');
      done();
    });
  })
}
