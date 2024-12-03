/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function onPlaceChildren1() {
  describe('onPlaceChildren1', () => {
    beforeEach(async (done: Function) => {
      console.info("onPlaceChildren1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PlaceChildren/onPlaceChildren1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get onPlaceChildren1 state pages: " + JSON.stringify(pages));
        if (!("onPlaceChildren1" == pages.name)) {
          console.info("get onPlaceChildren1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push onPlaceChildren1 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push onPlaceChildren1 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_onPlaceChildren1_001
    * @tc.name  : onMeasureSize
    * @tc.desc  : Get minHeight,maxHeight,minWidth,maxWidth from onPlaceChildren
    * @tc.level : Level 2
    */
    it('onPlaceChildren1_001', 0, async (done: Function) => {
      console.info('[onPlaceChildren1_001] START');
      await CommonFunc.sleep(500);
      let MaxHeightText1 = getInspectorByKey('constraint_maxHeight1');
      await CommonFunc.sleep(500);
      console.log('maxHeight111' + JSON.stringify(JSON.parse(MaxHeightText1).$attrs.content));
      expect(JSON.parse(MaxHeightText1).$attrs.content).assertEqual('600');
      await CommonFunc.sleep(500);
      let MinHeightText1 = getInspectorByKey('constraint_minHeight1');
      await CommonFunc.sleep(500);
      console.log('minHeight111' + JSON.stringify(JSON.parse(MinHeightText1).$attrs.content));
      expect(JSON.parse(MinHeightText1).$attrs.content).assertEqual('0');
      await CommonFunc.sleep(500);
      let MaxWidthText1 = getInspectorByKey('constraint_maxWidth1');
      await CommonFunc.sleep(500);
      console.log('maxWidth111' + JSON.stringify(JSON.parse(MaxWidthText1).$attrs.content));
      expect(JSON.parse(MaxWidthText1).$attrs.content).assertEqual('500');
      await CommonFunc.sleep(500);
      let MinWidthText1 = getInspectorByKey('constraint_minWidth1');
      await CommonFunc.sleep(500);
      console.log('minWidth111' + JSON.stringify(JSON.parse(MinWidthText1).$attrs.content));
      expect(JSON.parse(MinWidthText1).$attrs.content).assertEqual('0');
      await CommonFunc.sleep(500);
      console.info('[onPlaceChildren1_001] END');
      done();
    });
  })
}
