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
import router from '@system.router';
export default function checkBoxGroupTest() {
  describe('ActsCheckBoxGroupTest', function () {

    beforeEach(async function (done) {
      let options = {
        uri:  "TestAbility/pages/CheckBoxGroup",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CheckBoxGroup state success " + JSON.stringify(pages));
        if (!("CheckBoxGroup" == pages.name)) {
          console.info("get CheckBoxGroup state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push CheckBoxGroup page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CheckBoxGroup page error " + JSON.stringify(err));
      }
      await sleep(2)
      done()
    });

    /*
    *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0100
    *tc.name   Tests the unselectedColor property of the CheckboxGroup component
    *tc.desc   Set the unselectedColor property parameter to 0x00ff00
    */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0100', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0100');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0100 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0200
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to '#fffd0000'
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0200', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0200');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0200 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0300
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to 'rgb(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0300', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0300');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0300 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0400
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0400', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0400');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0400 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0500
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to $r("app.color.checkbox_Color")
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0500', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0500');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0500 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0600
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to an outlier ""
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0600', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0600');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0600 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#66182431");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0700
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to an outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0700', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0700');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0700 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#66182431");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0800
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to an outlier undefined
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0800', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0800');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0800 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#66182431");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_0900
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to Color.Pink
     *          and again set the unselectedColor property parameter to "#FFFD0000".
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_0900', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_0900');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_0900 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_1000
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to Color.Pink
     *          and again set the unselectedColor property parameter to the outlier value of undefined
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_1000', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1000');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1000 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#66182431");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_1100
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set unselectedColor property parameter to outlier 'bgr(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_1100', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1100');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1100 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#66182431");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_unselectedColor_1200
     *tc.name   Tests the unselectedColor property of the CheckboxGroup component
     *tc.desc   Set the unselectedColor property parameter to 0x00ff00
     *          and the universal property backgroundColor property value to the outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_unselectedColor_1200', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_unselectedColor_1200');
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_unselectedColor_1200 component obj.$attrs.unselectedColor is: " +
          JSON.stringify(obj.$attrs.unselectedColor));
          expect(obj.$attrs.unselectedColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_unselectedColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
    *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100
    *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
    *tc.desc   Set the checkMarkColor property parameter to 0x00ff00
    */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component obj.$attrs.mark is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to '#fffd0000'
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to 'rgb(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FF8A2BE2");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0300 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to Color.Pink
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFFC0CB");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0400 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to $r("app.color.checkbox_Color")
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0500 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to an outlier ""
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0600 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to an outlier null
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0700 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to an outlier undefined
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0800 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to Color.Pink
     *          and again set the checkMarkColor property parameter to "#FFFD0000".
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFD0000");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_0900 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to Color.Pink
     *          and again set the checkMarkColor property parameter to the outlier 'bgr(138,43,226)'.
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1000 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set checkMarkColor property parameter to outlier 'bgr(138,43,226)'
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FFFFFFFF");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1100 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });

    /*
     *tc.number ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200
     *tc.name   Tests the CheckMarkColor property of the CheckboxGroup component
     *tc.desc   Set the checkMarkColor property parameter to 0x00ff00
     *          and the universal property backgroundColor property value to null outlier
     */
    it('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200', 0, async function (done) {
      console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 START');
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200');
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parse(strJson);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component obj is: " + JSON.stringify(obj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component obj.$attrs is: " +
          JSON.stringify(obj.$attrs));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component obj.$attrs.strokeColor is: " +
          JSON.stringify(obj.$attrs.mark));
          let markObj = JSON.parse(obj.$attrs.mark);
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component markObj is: " +
          JSON.stringify(markObj));
          console.info("ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 component markObj.strokeColor is: " +
          JSON.stringify(markObj.strokeColor));
          expect(markObj.strokeColor).assertEqual("#FF00FF00");
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 END ');
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_CheckboxGroup_CheckMarkColor_1200 ERR  ' + JSON.stringify(err));
        }
        done();
      }, 500)
    });
  })
}
