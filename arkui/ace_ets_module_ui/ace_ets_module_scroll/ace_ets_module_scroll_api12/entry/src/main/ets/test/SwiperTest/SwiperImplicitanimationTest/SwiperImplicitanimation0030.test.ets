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

export default function SwiperImplicitanimation0030() {
  describe('SwiperImplicitanimation0030', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperImplicitanimation0030 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperImplicitanimation0030 state pages:" + JSON.stringify(pages));
        if (!("SwiperImplicitanimation0030" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperImplicitanimation/SwiperImplicitanimation0030'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperImplicitanimation0030 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperImplicitanimation0030 page error:" + err);
      }
      console.info("SwiperImplicitanimation0030 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperImplicitanimation0030 after each called");
    });

    /**
     * @tc.number SWIPER_IMPLICITANIMATION_0030
     * @tc.name step
     * @tc.desc change
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0030', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0030 START");
      let driver: Driver = Driver.create();
      let swiperArrow = await driver.findComponent(ON.id("implicitanimation_0030"));
      let point2 = await swiperArrow.getBoundsCenter();
      await driver.fling({x: point2.x + 150, y: point2.y}, {x: point2.x - 250, y: point2.y}, 5, 5000);
      await CommonFunc.sleep(300);
      await driver.fling({x: point2.x + 150, y: point2.y}, {x: point2.x - 250, y: point2.y}, 5, 5000);
      await CommonFunc.sleep(300);
      let strIndex: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex: ESObject = JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('1')
      await driver.drag(point2.x +200,  point2.y,point2.x - 150,point2.y,500)
      await CommonFunc.sleep(1000);
      let strIndex0: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex0: ESObject = JSON.parse(strIndex0).$attrs.content;
      expect(jsonIndex0).assertEqual('2')
      let tarindex: string = getInspectorByKey('implicitanimation_0030_2')
      let tarindex1: ESObject = JSON.parse(tarindex).$attrs.content;
      expect(tarindex1).assertEqual('1')
      await driver.fling({x: point2.x -150, y: point2.y}, {x: point2.x +250, y: point2.y}, 5, 5000);
      await CommonFunc.sleep(300);
      await driver.fling({x: point2.x -150, y: point2.y}, {x: point2.x +250, y: point2.y}, 5, 5000);
      await CommonFunc.sleep(300);
      let strIndex3: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex3: ESObject = JSON.parse(strIndex3).$attrs.content;
      expect(jsonIndex3).assertEqual('1')
      await driver.drag(point2.x -200,  point2.y,point2.x +150,point2.y,500);
      await CommonFunc.sleep(300);
      let strIndex4: string = getInspectorByKey('implicitanimation_0030_1')
      let jsonIndex4: ESObject = JSON.parse(strIndex4).$attrs.content;
      expect(jsonIndex4).assertEqual('0')
      let tarindex5: string = getInspectorByKey('implicitanimation_0030_2')
      let jsonIndex5: ESObject = JSON.parse(tarindex5).$attrs.content;
      expect(jsonIndex5).assertEqual('-1')
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_IMPLICITANIMATION_0030 END');
      done();
    });

  })
}