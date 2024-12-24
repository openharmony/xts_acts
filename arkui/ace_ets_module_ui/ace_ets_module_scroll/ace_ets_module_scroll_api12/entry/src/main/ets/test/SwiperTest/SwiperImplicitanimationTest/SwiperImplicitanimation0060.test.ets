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
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';

export default function SwiperImplicitanimation0060() {
  describe('SwiperImplicitanimation0060', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperImplicitanimation0060 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0060 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0060" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0060'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0060 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0060 page error:" + err);
      }
      console.info("SwiperImplicitanimation0060 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0060 after each called");
    });

    /**
     * @tc.number SWIPER_IMPLICITANIMATION_0060
     * @tc.name step
     * @tc.desc change
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0060', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0060 START");
      let driver: Driver = Driver.create();
      let swiperArrow = await driver.findComponent(ON.id("implicitanimation_0060"));
      let point2 = await swiperArrow.getBoundsCenter();
      await driver.fling({x: point2.x + 200, y: point2.y}, {x: point2.x - 150, y: point2.y}, 5, 1000);
      await driver.fling({x: point2.x -200, y: point2.y}, {x: point2.x + 150, y: point2.y}, 5, 1000);
      await CommonFunc.sleep(500);
      let strIndex: string = getInspectorByKey('implicitanimation_0060_1')
      let jsonIndex: ESObject = JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('1')
      await driver.drag(point2.x -200,  point2.y,point2.x + 150,point2.y,500)
      await CommonFunc.sleep(1000);
      let strIndex0: string = getInspectorByKey('implicitanimation_0060_1')
      let jsonIndex0: ESObject = JSON.parse(strIndex0).$attrs.content;
      expect(jsonIndex0).assertEqual('0')
      let tarindex: string = getInspectorByKey('implicitanimation_0060_2')
      let tarindex1: ESObject = JSON.parse(tarindex).$attrs.content;
      expect(tarindex1).assertEqual('0')
      let currindex: string = getInspectorByKey('implicitanimation_0060_3')
      let currindex2: ESObject = JSON.parse(currindex).$attrs.content;
      expect(currindex2 != 0).assertTrue();
      let taroffindex: string = getInspectorByKey('implicitanimation_0060_4')
      let taroffindex2: ESObject = JSON.parse(taroffindex).$attrs.content;
      expect(taroffindex2 != 0).assertTrue();
      let velocity: string = getInspectorByKey('implicitanimation_0060_5')
      let velocity1: ESObject = JSON.parse(velocity).$attrs.content;
      expect(velocity1 != 0).assertTrue();
      let showPrevious = await driver.findComponent(ON.id("btn_implicitanimation_0060"));
      await showPrevious.click();
      await CommonFunc.sleep(1000);
      await driver.drag(point2.x +200,  point2.y,point2.x - 150,point2.y,500)
      await CommonFunc.sleep(1000);
      let strIndex4: string = getInspectorByKey('implicitanimation_0060_1')
      let jsonIndex4: ESObject = JSON.parse(strIndex4).$attrs.content;
      expect(jsonIndex4).assertEqual('2')
      let strIndex5: string = getInspectorByKey('implicitanimation_0060_2')
      let jsonIndex5: ESObject = JSON.parse(strIndex5).$attrs.content;
      expect(jsonIndex5).assertEqual('2')
      let currindex_1: string = getInspectorByKey('implicitanimation_0060_3')
      let currindex2_1: ESObject = JSON.parse(currindex_1).$attrs.content;
      expect(currindex2_1 != 0).assertTrue();
      let taroffindex_1: string = getInspectorByKey('implicitanimation_0060_4')
      let taroffindex2_1: ESObject = JSON.parse(taroffindex_1).$attrs.content;
      expect(taroffindex2_1 != 0).assertTrue();
      let velocity_1: string = getInspectorByKey('implicitanimation_0060_5')
      let velocity1_1: ESObject = JSON.parse(velocity_1).$attrs.content;
      expect(velocity1_1 != 0).assertTrue();
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0060 END');
      done();
    });

  })
}