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
export default function SR000HR4C4Test() {

  const SUITE = 'SR000HR4C4'
  describe('SR000HR4C4Test', function () {
    beforeEach(async function (done) {
      let options = {
        url: "TestAbility/pages/SR000HR4C4",
      }

      try {
        router.clear();
        let pages = router.getState();
        if (pages == null || !("SR000HR4C4" == pages.name)) {
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
     *tc.number ArkUI_Image_Text_0100
     *tc.name   ImageSpan.verticalAlign(ImageSpanAlignment.BASELINE/CENTER/TOP/BOTTOM)
     *tc.desc   ImageSpan.verticalAlign(ImageSpanAlignment.BASELINE/CENTER/TOP/BOTTOM)
     */
    it('ArkUI_Image_Text_0100', 0, async function (done) {
      let CASE = 'ArkUI_Image_Text_0100'
      console.info(`${SUITE} ${CASE} START`);

      let strJson = getInspectorByKey('SR000HR4C4_ImageSpan1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.verticalAlign.split('.')[1]).assertEqual('BASELINE')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan2');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.verticalAlign.split('.')[1]).assertEqual('CENTER')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan3');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.verticalAlign.split('.')[1]).assertEqual('TOP')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan4');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.verticalAlign.split('.')[1]).assertEqual('BOTTOM')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0200
     *tc.name   ImageSpan.objectFit(Contain/Cover/Auto/Fill/ScaleDown/None)
     *tc.desc   ImageSpan.objectFit(Contain/Cover/Auto/Fill/ScaleDown/None)
     */
    it('ArkUI_Image_Text_0200', 0, async function (done) {
      let CASE = 'ArkUI_Image_Text_0200'
      console.info(`${SUITE} ${CASE} START`);

      let strJson = getInspectorByKey('SR000HR4C4_ImageSpan5');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Contain')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan6');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Cover')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan7');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Auto')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan8');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.Fill')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan9');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.ScaleDown')

      strJson = getInspectorByKey('SR000HR4C4_ImageSpan10');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.objectFit).assertEqual('ImageFit.None')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0300
     *tc.name   Text.textIndent
     *tc.desc   Text.textIndent
     */
    it('ArkUI_Image_Text_0300', 0, async function (done) {
      let CASE = 'ArkUI_Image_Text_0300'
      console.info(`${SUITE} ${CASE} START`);

      let strJson = getInspectorByKey('SR000HR4C4_Text1');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.textIndent).assertEqual(undefined)
      if ( sendEventByKey('SR000HR4C4_Button1', 10, null) ) {
        let strJson = getInspectorByKey('SR000HR4C4_Text1');
        let obj = JSON.parse(strJson);
        expect(obj.$attrs.textIndent).assertEqual(undefined)
      }
      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0400
     *tc.name   ImageSpan(null/undefined/'')
     *tc.desc   ImageSpan(null/undefined/'')
     */
    it('ArkUI_Image_Text_0400', 0, async function (done) {
      let CASE = 'ArkUI_Image_Text_0400'
      console.info(`${SUITE} ${CASE} START`);

      let strJson = getInspectorByKey('SR000HR4C4_ImageSpan12');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')
      strJson = getInspectorByKey('SR000HR4C4_ImageSpan13');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')
      strJson = getInspectorByKey('SR000HR4C4_ImageSpan14');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0500
     *tc.name   verticalAlign(null/undefined)
     *tc.desc   verticalAlign(null/undefined)
     */
    it('ArkUI_Image_Text_0500', 0, async function (done) {
      let CASE = 'ArkUI_Image_Text_0500'
      console.info(`${SUITE} ${CASE} START`);

      let strJson = getInspectorByKey('SR000HR4C4_ImageSpan15');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')
      strJson = getInspectorByKey('SR000HR4C4_ImageSpan16');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0600
     *tc.name   objectFit(null/undefined)
     *tc.desc   objectFit(null/undefined)
     */
    it('ArkUI_Image_Text_0600', 0, async function (done) {
      let CASE = 'ArkUI_Image_Text_0600'
      console.info(`${SUITE} ${CASE} START`);

      let strJson = getInspectorByKey('SR000HR4C4_ImageSpan17');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')
      strJson = getInspectorByKey('SR000HR4C4_ImageSpan18');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /*
     *tc.number ArkUI_Image_Text_0700
     *tc.name   textIndent(null/undefined)
     *tc.desc   textIndent(null/undefined)
     */
    it('ArkUI_Image_Text_0700', 0, async function (done) {
      let CASE = 'ArkUI_Image_Text_0700'
      console.info(`${SUITE} ${CASE} START`);

      let strJson = getInspectorByKey('SR000HR4C4_ImageSpan19');
      let obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')
      strJson = getInspectorByKey('SR000HR4C4_ImageSpan20');
      obj = JSON.parse(strJson);
      expect(obj.$attrs.height).assertEqual('183.00px')
      expect(obj.$attrs.width).assertEqual('276.00px')

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

  })
}
