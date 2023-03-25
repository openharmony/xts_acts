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
  })
}