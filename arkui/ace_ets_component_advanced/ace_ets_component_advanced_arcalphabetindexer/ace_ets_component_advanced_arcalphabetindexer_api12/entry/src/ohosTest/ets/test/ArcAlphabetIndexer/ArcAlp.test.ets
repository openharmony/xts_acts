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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import router from '@system.router';
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
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedColor: " +
      JSON.stringify(obj.$attrs.selectedColor));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupColor: " +
      JSON.stringify(obj.$attrs.popupColor));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedBackgroundColor: " +
      JSON.stringify(obj.$attrs.selectedBackgroundColor));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] usePopup: " +
      JSON.stringify(obj.$attrs.usePopup));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedFont.size " +
      JSON.stringify(obj.$attrs.selectedFont.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedFont.style " +
      JSON.stringify(obj.$attrs.selectedFont.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedFont.weight " +
      JSON.stringify(obj.$attrs.selectedFont.weight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selectedFont.family " +
      JSON.stringify(obj.$attrs.selectedFont.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.size: " +
      JSON.stringify(obj.$attrs.font.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.style: " +
      JSON.stringify(obj.$attrs.font.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.weight: " +
      JSON.stringify(obj.$attrs.font.weight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] font.family: " +
      JSON.stringify(obj.$attrs.font.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.size: " +
      JSON.stringify(obj.$attrs.font.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.style: " +
      JSON.stringify(obj.$attrs.font.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.weight: " +
      JSON.stringify(obj.$attrs.font.weight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupFont.family: " +
      JSON.stringify(obj.$attrs.font.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] itemSize: " +
      JSON.stringify(obj.$attrs.itemSize));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] selected: " +
      JSON.stringify(obj.$attrs.selected));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] autoCollapse: " +
      JSON.stringify(obj.$attrs.autoCollapse));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0100] popupBackgroundBlurStyle: " +
      JSON.stringify(obj.$attrs.popupBackgroundBlurStyle));

      expect(obj.$attrs.color).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.selectedColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.popupColor).assertEqual('#FFFFFFFF');
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#FF1F71FF');
      expect(obj.$attrs.usePopup).assertEqual('false');
      expect(obj.$attrs.selectedFont.size).assertEqual('13.00fp');
      expect(obj.$attrs.selectedFont.style).assertEqual('FontStyle.Normal');
      expect(obj.$attrs.selectedFont.weight).assertEqual('500');
      expect(obj.$attrs.selectedFont.family).assertEqual(expectedFamily);
      expect(obj.$attrs.font.size).assertEqual('13.00fp');
      expect(obj.$attrs.font.style).assertEqual('FontStyle.Normal');
      expect(obj.$attrs.font.weight).assertEqual('500');
      expect(obj.$attrs.font.family).assertEqual(expectedFamily);
      expect(obj.$attrs.popupFont.size).assertEqual('19.00fp');
      expect(obj.$attrs.popupFont.style).assertEqual('FontStyle.Normal');
      expect(obj.$attrs.popupFont.weight).assertEqual('500');
      expect(obj.$attrs.popupFont.family).assertEqual(expectedFamily);
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
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedColor: " +
      JSON.stringify(obj.$attrs.selectedColor));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupColor: " +
      JSON.stringify(obj.$attrs.popupColor));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedBackgroundColor: " +
      JSON.stringify(obj.$attrs.selectedBackgroundColor));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupBackground: " +
      JSON.stringify(obj.$attrs.popupBackground));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] usePopup: " +
      JSON.stringify(obj.$attrs.usePopup));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedFont.size " +
      JSON.stringify(obj.$attrs.selectedFont.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedFont.style " +
      JSON.stringify(obj.$attrs.selectedFont.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedFont.weight " +
      JSON.stringify(obj.$attrs.selectedFont.weight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selectedFont.family " +
      JSON.stringify(obj.$attrs.selectedFont.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.size: " +
      JSON.stringify(obj.$attrs.font.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.style: " +
      JSON.stringify(obj.$attrs.font.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.weight: " +
      JSON.stringify(obj.$attrs.font.weight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] font.family: " +
      JSON.stringify(obj.$attrs.font.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.size: " +
      JSON.stringify(obj.$attrs.font.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.style: " +
      JSON.stringify(obj.$attrs.font.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.weight: " +
      JSON.stringify(obj.$attrs.font.weight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupFont.family: " +
      JSON.stringify(obj.$attrs.font.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] itemSize: " +
      JSON.stringify(obj.$attrs.itemSize));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] selected: " +
      JSON.stringify(obj.$attrs.selected));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] autoCollapse: " +
      JSON.stringify(obj.$attrs.autoCollapse));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0200] popupBackgroundBlurStyle: " +
      JSON.stringify(obj.$attrs.popupBackgroundBlurStyle));

      expect(obj.$attrs.color).assertEqual('#FFFFFAFA');
      expect(obj.$attrs.selectedColor).assertEqual('#FFFF0000');
      expect(obj.$attrs.popupColor).assertEqual('#FF00FF7F');
      expect(obj.$attrs.selectedBackgroundColor).assertEqual('#FF0000FF');
      expect(obj.$attrs.popupBackground).assertEqual('#FF1F71FF');
      expect(obj.$attrs.usePopup).assertEqual('true');
      expect(obj.$attrs.selectedFont.size).assertEqual('10.00fp');
      expect(obj.$attrs.selectedFont.style).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.selectedFont.weight).assertEqual('200');
      expect(obj.$attrs.selectedFont.family).assertEqual(expectedFamily);
      expect(obj.$attrs.font.size).assertEqual('15.00fp');
      expect(obj.$attrs.font.style).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.font.weight).assertEqual('300');
      expect(obj.$attrs.font.family).assertEqual(expectedFamily);
      expect(obj.$attrs.popupFont.size).assertEqual('20.00fp');
      expect(obj.$attrs.popupFont.style).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.popupFont.weight).assertEqual('400');
      expect(obj.$attrs.popupFont.family).assertEqual(expectedFamily);
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
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectedFont.size " +
      JSON.stringify(obj.$attrs.selectedFont.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectedFont.style " +
      JSON.stringify(obj.$attrs.selectedFont.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectedFont.fontWeight " +
      JSON.stringify(obj.$attrs.selectedFont.fontWeight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selectedFont.family " +
      JSON.stringify(obj.$attrs.selectedFont.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.size: " +
      JSON.stringify(obj.$attrs.font.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.style: " +
      JSON.stringify(obj.$attrs.font.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.fontWeight: " +
      JSON.stringify(obj.$attrs.font.fontWeight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] font.family: " +
      JSON.stringify(obj.$attrs.font.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.size: " +
      JSON.stringify(obj.$attrs.popupFont.size));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.style: " +
      JSON.stringify(obj.$attrs.popupFont.style));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.fontWeight: " +
      JSON.stringify(obj.$attrs.popupFont.fontWeight));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupFont.family: " +
      JSON.stringify(obj.$attrs.popupFont.family));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] itemSize: " +
      JSON.stringify(obj.$attrs.itemSize));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] selected: " +
      JSON.stringify(obj.$attrs.selected));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] autoCollapse: " +
      JSON.stringify(obj.$attrs.autoCollapse));
      console.info("[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] popupBackgroundBlurStyle: " +
      JSON.stringify(obj.$attrs.popupBackgroundBlurStyle));

      expect(obj.$attrs.selectedFont.size).assertEqual('10.00vp');
      expect(obj.$attrs.selectedFont.style).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.selectedFont.weight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.selectedFont.family).assertEqual(expectedFamily);
      expect(obj.$attrs.font.size).assertEqual('10.00vp');
      expect(obj.$attrs.font.style).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.font.weight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.font.family).assertEqual(expectedFamily);
      expect(obj.$attrs.popupFont.size).assertEqual('24.00vp');
      expect(obj.$attrs.popupFont.style).assertEqual('FontStyle.Italic');
      expect(obj.$attrs.popupFont.weight).assertEqual('FontWeight.Normal');
      expect(obj.$attrs.popupFont.family).assertEqual(expectedFamily);
      expect(obj.$attrs.itemSize).assertEqual('16.00vp');
      expect(obj.$attrs.selected).assertEqual('0');
      console.info('[ArkUX_Stage_ArcAlphabetIndexer_ComponentTest_0300] END');
      done();
    });
  })
}
