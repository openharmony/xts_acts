/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@system.router';
import { Driver, ON } from '@ohos.UiTest'
import CommonFunc from '../../MainAbility/utils/Common';

const expectedFamily = 'HarmonyOS Sans';
interface optionsObj {
  uri: string
}
export default function ArcAlphabetIndexer() {
    describe('ArcAlphabetIndexer', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/ArcAlp/ArcAlp',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get ArcAlphabetIndexer state pages: " + JSON.stringify(pages));
                if (!("ArcAlphabetIndexer" == pages.name)) {
                    console.info("get ArcAlphabetIndexer state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push ArcAlphabetIndexer page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push ArcAlphabetIndexer page error: " + err);
                expect().assertFail();
            }
            done();
        });

        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.number: ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100
         * @tc.name  : testArcAlphabetIndexerComponent.
         * @tc.desc  : verifyBaseFunction.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100', 0, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] START');
          let strJson = getInspectorByKey('arcAlphabetIndex01');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] color: " + JSON.stringify(obj.$attrs.color));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedColor: " + JSON.stringify(obj.$attrs.selectedColor));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupColor: " + JSON.stringify(obj.$attrs.popupColor));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedBackgroundColor: " + JSON.stringify(obj.$attrs.selectedBackgroundColor));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] usingPopup: " + JSON.stringify(obj.$attrs.usingPopup));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectFont.fontSize " + JSON.stringify(obj.$attrs.selectFont.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectFont.fontStyle " + JSON.stringify(obj.$attrs.selectFont.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectFont.fontWeight " + JSON.stringify(obj.$attrs.selectFont.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectFont.fontFamily " + JSON.stringify(obj.$attrs.selectFont.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.fontSize: " + JSON.stringify(obj.$attrs.font.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.fontStyle: " + JSON.stringify(obj.$attrs.font.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.fontWeight: " + JSON.stringify(obj.$attrs.font.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.fontFamily: " + JSON.stringify(obj.$attrs.font.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.fontSize: " + JSON.stringify(obj.$attrs.font.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.fontStyle: " + JSON.stringify(obj.$attrs.font.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.fontWeight: " + JSON.stringify(obj.$attrs.font.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.fontFamily: " + JSON.stringify(obj.$attrs.font.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] itemSize: " + JSON.stringify(obj.$attrs.itemSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selected: " + JSON.stringify(obj.$attrs.selected));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] autoCollapse: " + JSON.stringify(obj.$attrs.autoCollapse));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupBackgroundBlurStyle: " + JSON.stringify(obj.$attrs.popupBackgroundBlurStyle));

          expect(obj.$attrs.color).assertEqual('#FFFFFFFF');
          expect(obj.$attrs.selectedColor).assertEqual('#FFFFFFFF');
          expect(obj.$attrs.popupColor).assertEqual('#FFFFFFFF');
          expect(obj.$attrs.selectedBackgroundColor).assertEqual('#FF1F71FF');
          expect(obj.$attrs.usingPopup).assertEqual('false');
          expect(obj.$attrs.selectFont.fontSize).assertEqual('13.00fp');
          expect(obj.$attrs.selectFont.fontStyle).assertEqual('FontStyle.Normal');
          expect(obj.$attrs.selectFont.fontWeight).assertEqual('500');
          expect(obj.$attrs.selectFont.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.font.fontSize).assertEqual('13.00fp');
          expect(obj.$attrs.font.fontStyle).assertEqual('FontStyle.Normal');
          expect(obj.$attrs.font.fontWeight).assertEqual('500');
          expect(obj.$attrs.font.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.popupFont.fontSize).assertEqual('19.00fp');
          expect(obj.$attrs.popupFont.fontStyle).assertEqual('FontStyle.Normal');
          expect(obj.$attrs.popupFont.fontWeight).assertEqual('500');
          expect(obj.$attrs.popupFont.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.itemSize).assertEqual('24.00vp');
          expect(obj.$attrs.selected).assertEqual('0');
          expect(obj.$attrs.autoCollapse).assertEqual('true');
          expect(obj.$attrs.popupBackgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR');
          console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] END');
          done();
        });

        /**
         * @tc.number: ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200
         * @tc.name  : testArcAlphabetIndexerComponent.
         * @tc.desc  : verifyBaseFunction.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200', 0, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] START');
          let strJson = getInspectorByKey('arcAlphabetIndex02');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] color: " + JSON.stringify(obj.$attrs.color));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedColor: " + JSON.stringify(obj.$attrs.selectedColor));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupColor: " + JSON.stringify(obj.$attrs.popupColor));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedBackgroundColor: " + JSON.stringify(obj.$attrs.selectedBackgroundColor));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupBackground: " + JSON.stringify(obj.$attrs.popupBackground));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] usingPopup: " + JSON.stringify(obj.$attrs.usingPopup));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectFont.fontSize " + JSON.stringify(obj.$attrs.selectFont.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectFont.fontStyle " + JSON.stringify(obj.$attrs.selectFont.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectFont.fontWeight " + JSON.stringify(obj.$attrs.selectFont.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectFont.fontFamily " + JSON.stringify(obj.$attrs.selectFont.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.fontSize: " + JSON.stringify(obj.$attrs.font.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.fontStyle: " + JSON.stringify(obj.$attrs.font.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.fontWeight: " + JSON.stringify(obj.$attrs.font.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.fontFamily: " + JSON.stringify(obj.$attrs.font.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.fontSize: " + JSON.stringify(obj.$attrs.font.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.fontStyle: " + JSON.stringify(obj.$attrs.font.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.fontWeight: " + JSON.stringify(obj.$attrs.font.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.fontFamily: " + JSON.stringify(obj.$attrs.font.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] itemSize: " + JSON.stringify(obj.$attrs.itemSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selected: " + JSON.stringify(obj.$attrs.selected));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] autoCollapse: " + JSON.stringify(obj.$attrs.autoCollapse));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupBackgroundBlurStyle: " + JSON.stringify(obj.$attrs.popupBackgroundBlurStyle));

          expect(obj.$attrs.color).assertEqual('#FFFFFAFA');
          expect(obj.$attrs.selectedColor).assertEqual('#FFFF0000');
          expect(obj.$attrs.popupColor).assertEqual('#FF00FF7F');
          expect(obj.$attrs.selectedBackgroundColor).assertEqual('#FF0000FF');
          expect(obj.$attrs.popupBackground).assertEqual('#FF1F71FF');
          expect(obj.$attrs.usingPopup).assertEqual('true');
          expect(obj.$attrs.selectFont.fontSize).assertEqual('10.00fp');
          expect(obj.$attrs.selectFont.fontStyle).assertEqual('FontStyle.Italic');
          expect(obj.$attrs.selectFont.fontWeight).assertEqual('200');
          expect(obj.$attrs.selectFont.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.font.fontSize).assertEqual('15.00fp');
          expect(obj.$attrs.font.fontStyle).assertEqual('FontStyle.Italic');
          expect(obj.$attrs.font.fontWeight).assertEqual('300');
          expect(obj.$attrs.font.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.popupFont.fontSize).assertEqual('20.00fp');
          expect(obj.$attrs.popupFont.fontStyle).assertEqual('FontStyle.Italic');
          expect(obj.$attrs.popupFont.fontWeight).assertEqual('400');
          expect(obj.$attrs.popupFont.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.itemSize).assertEqual('20.00vp');
          expect(obj.$attrs.selected).assertEqual('1');
          expect(obj.$attrs.autoCollapse).assertEqual('false');
          expect(obj.$attrs.popupBackgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
          console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] END');
          done();
        });

        /**
         * @tc.number: ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300
         * @tc.name  : testArcAlphabetIndexerComponent.
         * @tc.desc  : verifyBaseFunction.
         * @tc.size  : MediumTest
         * @tc.type  : Function
         * @tc.level : Level 0
         */
        it('ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300', 0, async (done: Function) => {
          // Verify the functions of the ArcAlphabetIndexer component
          console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] START');
          let strJson = getInspectorByKey('arcAlphabetIndex03');
          let obj: Record<string, ESObject> = JSON.parse(strJson);
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] attr: " + JSON.stringify(obj.$attrs));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectFont.fontSize " + JSON.stringify(obj.$attrs.selectFont.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectFont.fontStyle " + JSON.stringify(obj.$attrs.selectFont.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectFont.fontWeight " + JSON.stringify(obj.$attrs.selectFont.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectFont.fontFamily " + JSON.stringify(obj.$attrs.selectFont.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.fontSize: " + JSON.stringify(obj.$attrs.font.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.fontStyle: " + JSON.stringify(obj.$attrs.font.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.fontWeight: " + JSON.stringify(obj.$attrs.font.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.fontFamily: " + JSON.stringify(obj.$attrs.font.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.fontSize: " + JSON.stringify(obj.$attrs.popupFont.fontSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.fontStyle: " + JSON.stringify(obj.$attrs.popupFont.fontStyle));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.fontWeight: " + JSON.stringify(obj.$attrs.popupFont.fontWeight));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.fontFamily: " + JSON.stringify(obj.$attrs.popupFont.fontFamily));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] itemSize: " + JSON.stringify(obj.$attrs.itemSize));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selected: " + JSON.stringify(obj.$attrs.selected));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] autoCollapse: " + JSON.stringify(obj.$attrs.autoCollapse));
          console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupBackgroundBlurStyle: " + JSON.stringify(obj.$attrs.popupBackgroundBlurStyle));

          expect(obj.$attrs.selectFont.fontSize).assertEqual('10.00vp');
          expect(obj.$attrs.selectFont.fontStyle).assertEqual('FontStyle.Italic');
          expect(obj.$attrs.selectFont.fontWeight).assertEqual('FontWeight.Normal');
          expect(obj.$attrs.selectFont.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.font.fontSize).assertEqual('10.00vp');
          expect(obj.$attrs.font.fontStyle).assertEqual('FontStyle.Italic');
          expect(obj.$attrs.font.fontWeight).assertEqual('FontWeight.Normal');
          expect(obj.$attrs.font.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.popupFont.fontSize).assertEqual('24.00vp');
          expect(obj.$attrs.popupFont.fontStyle).assertEqual('FontStyle.Italic');
          expect(obj.$attrs.popupFont.fontWeight).assertEqual('FontWeight.Normal');
          expect(obj.$attrs.popupFont.fontFamily).assertEqual(expectedFamily);
          expect(obj.$attrs.itemSize).assertEqual('16.00vp');
          expect(obj.$attrs.selected).assertEqual('0');
          console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] END');
          done();
        });
    })
}
