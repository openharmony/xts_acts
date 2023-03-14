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
// @ts-nocheck
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import hilog from '@ohos.hilog';

let emitKey = "emitUserAgent";

export default function swiperTest() {
  describe('ActSwiperTest', function () {

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0100
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:34,weight:"800"}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0100');
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("34.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.800");
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0200
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"20px",weight:200}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0200', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0200');
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0200 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("20.00px");
          expect(obj2.fontWeight).assertEqual("FontWeight.200");
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0200 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0300
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"48%",weight:900}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0300', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0300');
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0300 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("48.00%");
          expect(obj2.fontWeight).assertEqual("FontWeight.900");
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0300 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0400
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"",weight:FontWeight.Bolder}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0400', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0400');
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0400 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Bolder");
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0400 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0500
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:-2,weight:1000}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0500', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0500');
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0500 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0500 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0600
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"abc",weight:null}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0600', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0600');
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0600 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0600 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0700
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"1000%",weight:""}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0700', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0700');
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0700 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("1000.00%");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0700 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0800
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:"100vp",weight:"adf@$5"}
     */
    it('ArkUX_Stage_Swiper_DigitFont_0800', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0800');
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0800 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("100.00vp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0800 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_0900
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:10,weight:200},
     *               and set the digitFont property parameter to {size:"40lpx",weight:500} again
     */
    it('ArkUX_Stage_Swiper_DigitFont_0900', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_0900');
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_0900 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("40.00lpx");
          expect(obj2.fontWeight).assertEqual("FontWeight.500");
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_0900 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_1000
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:10,weight:500},
     *               and set the digitFont property parameter to the exception value {size:"abc",weight:null} again
     */
    it('ArkUX_Stage_Swiper_DigitFont_1000', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1000');
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_1000 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("14.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.Normal");
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_1000 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.number    ArkUX_Stage_Swiper_DigitFont_1100
     * @tc.name      Tests the digitFont property of the swiper component
     * @tc.desc      Set the digitFont property parameter to {size:10,weight:600},
     *               and set the general property size and layoutWeight property value to null
     */
    it('ArkUX_Stage_Swiper_DigitFont_1100', 0, async function (done) {
      console.info('ArkUX_Stage_Swiper_DigitFont_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_Swiper_DigitFont_1100');
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj.$attrs.digitFont is: " +
          JSON.stringify(obj.$attrs.digitFont));
          let obj2 = JSON.parse(obj.$attrs.indicator);
          console.info("ArkUX_Stage_Swiper_DigitFont_1100 component obj2 is: " + JSON.stringify(obj2));
          expect(obj2.fontSize).assertEqual("10.00fp");
          expect(obj2.fontWeight).assertEqual("FontWeight.600");
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 END ');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_Swiper_DigitFont_1100 ERR  ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}