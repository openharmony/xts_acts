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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function SymbolGlyphApi() {
  describe('SymbolGlyphApi', function () {
    beforeEach(async function (done) {
      console.info("SymbolGlyphApi beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphApi state pages:" + JSON.stringify(pages));
        if (!("SymbolGlyphApi" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/SymbolGlyph/SymbolGlyphApi"})
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphApi page error:" + err);
      }
      console.info("SymbolGlyphApi foreEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("SymbolGlyphApi after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_COMPONENT_SymbolGlyph_001
     * @tc.desc      symbolEffect test of SymbolGlyph
     * @tc.level     Level 3
     * @tc.type
     */

    it('SymbolGlyphApi_001', 0, async function (done) {
      console.info('[SymbolGlyphApi_001] START');

      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('SymbolGlyphApi');
      await CommonFunc.sleep(200);
      let obj = JSON.parse(JSON.parse(strJson).$attrs.symbolEffect).isActive + '';
      console.info("[styledStringApi_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj).assertEqual('true');
      console.info('[styledStringApi_001] END');
      done();

    });





  })
}
