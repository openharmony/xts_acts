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

//@ts-nocheck
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import router from '@system.router';
import events_emitter from '@ohos.events.emitter';

function sleep(time) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function sliderTest() {
  describe('ActsAbilityTest', function () {

    /*
       * @tc.number ArkUX_Stage_Slider_blockBorderColor_0100
       * @tc.name   Test the blockBorderColor property of the Slider component
       * @tc.desc   Set the blockBorderColor attribute to 0xffa500
       */
    it('ArkUX_Stage_Slider_blockBorderColor_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0100 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0200
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to "ffc709e9"
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0200 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0300
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to Color.Pink
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0300 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFFFC0CB");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0400
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to $r("app.color.start_block_Border_Color")
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0400 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FF19D41C");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0500
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to null
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0500 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done()
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0600
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to "rgb(0,255,255)"
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0600 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FF00FFFF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0700
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to 0x00ff00 and set the backgroundColor attribute to Color.Pink
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0700 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FF00FF00");
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Slider_blockBorderColor_0700 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0800
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to undefined
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0800 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_0900
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to  "bgr(138,43,226)"
      */
    it('ArkUX_Stage_Slider_blockBorderColor_0900', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_0900');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_0900 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_0900 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_1000
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to " "
      */
    it('ArkUX_Stage_Slider_blockBorderColor_1000', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1000');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1000 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_1100
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Do not set the blockBorderColor
      */
    it('ArkUX_Stage_Slider_blockBorderColor_1100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1100 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#00000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_1200
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to 0xffa500a and then set the blockBorderColor attribute to "#ffc709e9"
      */
    it('ArkUX_Stage_Slider_blockBorderColor_1200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1200 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderColor_1300
      * @tc.name   Test the blockBorderColor property of the Slider component
      * @tc.desc   Set the blockBorderColor attribute to 0xffa500 and then set the blockBorderColor attribute  to "bgr(138,43,226)"
      */
    it('ArkUX_Stage_Slider_blockBorderColor_1300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderColor_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderColor_1300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_blockBorderColor_1300 is" + JSON.stringify(obj.$attrs.blockBorderColor));
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0100
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to 5
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0100 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0200
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to "5px"
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0200 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0300
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to $r("app.string.block_border_width_test")
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0300 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("7.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0400
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to ' '
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0400 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0500
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to null
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0500 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0600
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to undefined
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0600 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0700
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to 0
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0700 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0800
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to -1
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0800 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })


    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_0900
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Do not set the blockBorderWidth
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_0900', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_0900');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_0900 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
  * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1000
  * @tc.name   Test the blockBorderWidth property of the Slider component
  * @tc.desc   Set the blockBorderWidth attribute to 5 and then set the blockBorderWidth attribute to 7          
  */
    it('ArkUX_Stage_Slider_blockBorderWidth_1000', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1000');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1000 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("7.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1100
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to 5 and set the blockBorderWidth attribute to undefined          
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_1100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1100 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1200
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to "asdf%^7"
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_1200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1200 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockBorderWidth_1300
      * @tc.name   Test the blockBorderWidth property of the Slider component
      * @tc.desc   Set the blockBorderWidth attribute to 5, and set the general property width parameter to 7
      */
    it('ArkUX_Stage_Slider_blockBorderWidth_1300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockBorderWidth_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockBorderWidth_1300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockBorderWidth_1300 is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          expect(obj.$attrs.blockBorderWidth).assertEqual("5.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockBorderWidth_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
        * @tc.number ArkUX_Stage_Slider_stepColor_0100
        * @tc.name   Test the stepColor property of the Slider component
        * @tc.desc   Set the stepColor attribute to  0xffa500
        */
    it('ArkUX_Stage_Slider_stepColor_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0100 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0200
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to "#ffc709e9"
      */
    it('ArkUX_Stage_Slider_stepColor_0200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0200 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0300
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to Color.Pink
      */
    it('ArkUX_Stage_Slider_stepColor_0300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0300 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFFFC0CB");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0400
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to $r("app.color.start_Step_Color")
      */
    it('ArkUX_Stage_Slider_stepColor_0400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0400 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FF19D41C");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0500
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to null
      */
    it('ArkUX_Stage_Slider_stepColor_0500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0500 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#19182431");
          done()
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0600
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to "rgb(0,255,255)"
      */
    it('ArkUX_Stage_Slider_stepColor_0600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0600 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FF00FFFF");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0700
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to 0x00ff00, and set the general property backgroundColor parameter to Color.Pink
      */
    it('ArkUX_Stage_Slider_stepColor_0700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0700 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FF00FF00");
          done();
        } catch (err) {
          expect().assertFail()
          console.info('ArkUX_Stage_Slider_stepColor_0700 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0800
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to  undefined
      */
    it('ArkUX_Stage_Slider_stepColor_0800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0800 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#19182431");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_0900
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to "bgr(138,43,226)"
      */
    it('ArkUX_Stage_Slider_stepColor_0900', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_0900');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_0900 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#19182431");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_0900 ERROR: ' + JSON.stringify(err));
          done()
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_1000
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to ""
      */
    it('ArkUX_Stage_Slider_stepColor_1000', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1000');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1000 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#19182431");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_1100
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Do not set the stepColor
      */
    it('ArkUX_Stage_Slider_stepColor_1100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1100 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#19182431");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepColor_1200
      * @tc.name   Test the stepColor property of the Slider component
      * @tc.desc   Set the stepColor attribute to 0xffa500 and then set the stepColor attribute parameter again to "#ffc709e9"
      */
    it('ArkUX_Stage_Slider_stepColor_1200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1200 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFC709E9");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number: ArkUX_Stage_Slider_stepColor_1300
      * @tc.name: Test the stepColor property of the Slider component
      * @tc.desc: Set the stepColor attribute to 0xffa500 and then set the stepColor attribute parameter again to "bgr(138,43,226)"
      */
    it('ArkUX_Stage_Slider_stepColor_1300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepColor_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepColor_1300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepColor_1300 is" + JSON.stringify(obj.$attrs.stepColor));
          expect(obj.$attrs.stepColor).assertEqual("#FFFFA500");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepColor_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0100
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to 0
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0100 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0200
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to 10
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0200 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0300
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to "60px"
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0300 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("60.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0400
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to "120%"
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0400 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("120.00%");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0500
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to $r("app.string.trach_border_radius_test")
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0500 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("50.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0600
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to ""
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0600 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0700
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to null
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0700 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0800
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to undefined
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0800 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_0900
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to -1
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_0900', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_0900');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_0900 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1000
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Do not set the trackBorderRadius
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_1000', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1000');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1000 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual(undefined);
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1100
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to 10 and then set the trackBorderRadius attribute parameter again to 40          
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_1100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1100 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("40.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1200
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to 10 and then set the trackBorderRadius attribute parameter again to undefined           
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_1200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1200 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1300
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to "asdf#$8"
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_1300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1300 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_trackBorderRadius_1400
      * @tc.name   Test the trackBorderRadius property of the Slider component
      * @tc.desc   Set the trackBorderRadius attribute to 0, and set the general property size parameter to null
      */
    it('ArkUX_Stage_Slider_trackBorderRadius_1400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_trackBorderRadius_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_trackBorderRadius_1400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_trackBorderRadius_1400 is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          expect(obj.$attrs.trackBorderRadius).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_trackBorderRadius_1400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0100
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the blockSize attribute both to 0
      */
    it('ArkUX_Stage_Slider_blockSize_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0100 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0100 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0200
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the blockSize attribute both to 5
      */
    it('ArkUX_Stage_Slider_blockSize_0200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0200 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0200 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("7.500000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("7.500000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0300
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to 15 ,height attribute to 20 in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_0300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0300 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0300 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("22.500000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("30.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0400
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to 12 ,height attribute to 12 in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_0400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0400 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0400 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0500
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to "20px" ,height attribute to "20px" in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_0500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0500 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0500 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("20.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("20.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0600
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to "120%" ,height attribute to "120%" in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_0600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0600 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0600 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0700
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to $r("app.string.block_size_width_test"),height attribute to 
      *            $r("app.string.block_size_width_test")in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_0700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0700 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0700 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("75.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("75.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0800
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to " ",height attribute to " " in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_0800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0800 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0800 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_0900
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to null ,height attribute to null in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_0900', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_0900');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_0900 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_0900 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1000
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to undefined ,height attribute to undefined in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_1000', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1000');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1000 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1000 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1100
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to -1 ,height attribute to -1 in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_1100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1100 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1100 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1200
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to -1 ,height attribute to 15 in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_1200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1200 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1200 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("22.500000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1300
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to "15" ,height attribute to "-1" in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_1300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1300 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1300 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("22.500000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1400
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Do not set the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_1400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1400 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1400 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("12.00vp");
          expect(obj.$attrs.blockSizeHeight).assertEqual("12.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1500
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to 15 ,height attribute to 20 in the blockSize and then  set the width attribute to "20fp",
      *            height attribute to "25fp" in the blockSize           
      */
    it('ArkUX_Stage_Slider_blockSize_1500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1500 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1500 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("30.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("37.500000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1600
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to 15 ,height attribute to 20 in the blockSize and then set the width attribute to -1,
      *            height attribute to -1 in the blockSize 
      */
    it('ArkUX_Stage_Slider_blockSize_1600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1600 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1600 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("22.500000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("30.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1700
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to "asdf#$8" ,height attribute to "asdf#$8" in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_1700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1700 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1700 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("18.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("18.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockSize_1800
      * @tc.name   Test the blockSize property of the Slider component
      * @tc.desc   Set the width attribute to "20lsp" ,height attribute to "20lsp" in the blockSize
      */
    it('ArkUX_Stage_Slider_blockSize_1800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockSize_1800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockSize_1800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockSizeWidth_1800 is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_blockSizeHeight_1800 is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          expect(obj.$attrs.blockSizeWidth).assertEqual("30.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("30.000000");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockSize_1800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0100
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to 0
      */
    it('ArkUX_Stage_Slider_stepSize_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0100 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0200
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to 10
      */
    it('ArkUX_Stage_Slider_stepSize_0200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0200 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0300
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to "60px"
      */
    it('ArkUX_Stage_Slider_stepSize_0300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0300 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("60.00px");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0400
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to "120%"
      */
    it('ArkUX_Stage_Slider_stepSize_0400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0400 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("120.00%");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0400 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0500
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to  $r("app.string.step_size_test")
      */
    it('ArkUX_Stage_Slider_stepSize_0500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0500 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("50.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0500 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0600
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to " "
      */
    it('ArkUX_Stage_Slider_stepSize_0600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0600 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0600 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0700
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to  null
      */
    it('ArkUX_Stage_Slider_stepSize_0700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0700 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0700 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0800
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to undefined
      */
    it('ArkUX_Stage_Slider_stepSize_0800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0800 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0800 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_0900
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to -1
      */
    it('ArkUX_Stage_Slider_stepSize_0900', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_0900');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_0900 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_0900 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_1000
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Do not set the blockSize
      */
    it('ArkUX_Stage_Slider_stepSize_1000', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1000');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1000 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("4.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_1000 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_1100
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to 10 and then set the stepSize attribute  to 40
      */
    it('ArkUX_Stage_Slider_stepSize_1100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1100 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("40.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_1100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_1200
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to 10，set the stepSize attribute parameter again to undefined
      */
    it('ArkUX_Stage_Slider_stepSize_1200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1200 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_1200 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_1300
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to "asdf#$8"
      */
    it('ArkUX_Stage_Slider_stepSize_1300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1300 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("0.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_1300 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_stepSize_1400
      * @tc.name   Test the stepSize property of the Slider component
      * @tc.desc   Set the stepSize attribute to 10, and set the general property  size parameter to null
      */
    it('ArkUX_Stage_Slider_stepSize_1400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_stepSize_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_stepSize_1400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_stepSize_1400 is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.stepSize).assertEqual("10.00vp");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_stepSize_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0100
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle attribute to sliderDefault
      */
    it('ArkUX_Stage_Slider_blockStyle_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0100 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0200
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Do not set the blockStyle property parameter
      */
    it('ArkUX_Stage_Slider_blockStyle_0200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0200 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0300
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute BlockStyleType.IMAGE
      */
    it('ArkUX_Stage_Slider_blockStyle_0300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0300 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.IMAGE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0400
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to  BlockStyleType.Shape
      */
    it('ArkUX_Stage_Slider_blockStyle_0400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0400 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0500
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
      */
    it('ArkUX_Stage_Slider_blockStyle_0500', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0500] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0500');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0500 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0600
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
      */
    it('ArkUX_Stage_Slider_blockStyle_0600', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0600] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0600');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0600 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0600  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0700
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
      */
    it('ArkUX_Stage_Slider_blockStyle_0700', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0700] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0700');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0700 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0700  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0800
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
      */
    it('ArkUX_Stage_Slider_blockStyle_0800', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0800] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0800');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0800 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0800  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_0900
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.IMAGE
      */
    it('ArkUX_Stage_Slider_blockStyle_0900', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_0900] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_0900');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_0900 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.IMAGE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_0900  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_1000
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
      */
    it('ArkUX_Stage_Slider_blockStyle_1000', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_1000] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1000');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1000 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_1000  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_1100
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
      */
    it('ArkUX_Stage_Slider_blockStyle_1100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_1100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1100');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1100 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_1100  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_1200
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
      */
    it('ArkUX_Stage_Slider_blockStyle_1200', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_1200] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1200');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1200 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_1200  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_1300
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.DEFAULT
      */
    it('ArkUX_Stage_Slider_blockStyle_1300', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_1300] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1300');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1300 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.DEFAULT");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_1300  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number ArkUX_Stage_Slider_blockStyle_1400
      * @tc.name   Test the blockStyle property of the Slider component
      * @tc.desc   Set the blockStyle property attribute to BlockStyleType.Shape
      */
    it('ArkUX_Stage_Slider_blockStyle_1400', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_blockStyle_1400] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_blockStyle_1400');
          let obj = JSON.parse(strJson);
          console.info("----ArkUX_Stage_Slider_blockStyle_1400 is" + JSON.stringify(obj.$attrs.blockType));
          expect(obj.$attrs.blockType).assertEqual("BlockStyleType.SHAPE");
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_blockStyle_1400  ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

    /** 
      * @tc.number: ArkUX_Stage_Slider_Test_0100
      * @tc.name: Test the new attributes of Slider component
      * @tc.desc: Set the blockSizeWidth attribute parameter is 10
      *           Set the blockHeight attribute parameter again to 10
      *           Set the blockBorderColor attribute parameter again to "#fff10202"
      *           Set the blockBorderWidth attribute parameter again to 10
      *           Set the stepColor attribute parameter again to "#fff10202"
      *           Set the trackBorderRadius attribute parameter again to 15
      *           Set the stepSize attribute parameter again to 10
      */
    it('ArkUX_Stage_Slider_Test_0100', 0, async function (done) {
      console.info('[ArkUX_Stage_Slider_Test_0100] START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Slider_Test_0100');
          let obj = JSON.parse(strJson);
          console.info("-->ArkUX_Stage_Slider_Test_0100 component obj is: " + JSON.stringify(obj));
          console.info("-->ArkUX_Stage_Slider_Test_0100 obj.$attrs is: " + JSON.stringify(obj.$attrs));
          console.info("----ArkUX_Stage_Slider_Test_0100 blockSizeWidth is" + JSON.stringify(obj.$attrs.blockSizeWidth));
          console.info("----ArkUX_Stage_Slider_Test_0100 blockSizeHeight is" + JSON.stringify(obj.$attrs.blockSizeHeight));
          console.info("----ArkUX_Stage_Slider_Test_0100 blockBorderColor is" + JSON.stringify(obj.$attrs.blockBorderColor));
          console.info("----ArkUX_Stage_Slider_Test_0100 blockBorderWidth is" + JSON.stringify(obj.$attrs.blockBorderWidth));
          console.info("----ArkUX_Stage_Slider_Test_0100 stepColor is" + JSON.stringify(obj.$attrs.stepColor));
          console.info("----ArkUX_Stage_Slider_Test_0100 trackBorderRadius is" + JSON.stringify(obj.$attrs.trackBorderRadius));
          console.info("----ArkUX_Stage_Slider_Test_0100 stepSize is" + JSON.stringify(obj.$attrs.stepSize));
          expect(obj.$attrs.blockSizeWidth).assertEqual("15.000000");
          expect(obj.$attrs.blockSizeHeight).assertEqual("15.000000");
          expect(obj.$attrs.blockBorderWidth).assertEqual("10.00vp")
          expect(obj.$attrs.blockBorderColor).assertEqual("#FFC709E9")
          expect(obj.$attrs.stepColor).assertEqual("#FFF10202")
          expect(obj.$attrs.trackBorderRadius).assertEqual("15.00vp")
          expect(obj.$attrs.stepSize).assertEqual("10.00vp")
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Slider_Test_0100 ERROR: ' + JSON.stringify(err));
          done();
        }
      }, 500)
    })

  })
}
