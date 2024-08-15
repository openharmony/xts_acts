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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

interface optionsObj {
  uri: string
}

export default function ArcListDemo() {
    describe('ArcList', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/ArcList/ArcList',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get ArcListPage state pages: " + JSON.stringify(pages));
                if (!("ArcList" == pages.name)) {
                    console.info("get ArcList state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push ArcList page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push ArcList page error: " + err);
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

    /* *
    * @tc.number: ArkUX_Stage_ArkList_ComponentTest_0100
    * @tc.name  : testArkListComponent.
    * @tc.desc  : Test default value for testing the arclist component.
    * @tc.level : Level 1
    * @tc.size  : MediumTest
    * @tc.type  : Function
    */
    it('ArkUX_Stage_ArkList_ComponentTest_0100', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_ArkList_ComponentTest_0100] START');
      let strJson = getInspectorByKey('arclistdefault');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] scrollBarColor: " + JSON.stringify(obj.$attrs.scrollBarColor));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] enableScrollInteraction: " + JSON.stringify(obj.$attrs.enableScrollInteraction));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] fadingEdge: " + JSON.stringify(obj.$attrs.fadingEdge));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] friction: " + JSON.stringify(obj.$attrs.friction));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0100] flingSpeedLimit: " + JSON.stringify(obj.$attrs.flingSpeedLimit));

      expect(obj.$attrs.space).assertEqual('0.00vp');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      expect(obj.$attrs.scrollBarWidth).assertEqual('4.00vp');
      expect(obj.$attrs.scrollBarColor).assertEqual('#66182431');
      expect(obj.$attrs.cachedCount).assertEqual('0');
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      expect(obj.$attrs.fadingEdge).assertEqual(false);
      expect(obj.$attrs.friction).assertEqual(0.800000011920929);
      expect(obj.$attrs.flingSpeedLimit).assertEqual('4200.00vp');
      console.info('[ArkUX_Stage_ArkList_ComponentTest_0100] END');
      done();
    });

    /* *
    * @tc.number: ArkUX_Stage_ArkList_ComponentTest_0200
    * @tc.name  : testArkListComponent.
    * @tc.desc  : Test default value for testing the arclist component.
    * @tc.level : Level 1
    * @tc.size  : MediumTest
    * @tc.type  : Function
    */
    it('ArkUX_Stage_ArkList_ComponentTest_0200', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_ArkList_ComponentTest_0200] START');
      let strJson = getInspectorByKey('arclist01');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] scrollBarColor: " + JSON.stringify(obj.$attrs.scrollBarColor));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] enableScrollInteraction: " + JSON.stringify(obj.$attrs.enableScrollInteraction));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] fadingEdge: " + JSON.stringify(obj.$attrs.fadingEdge));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] friction: " + JSON.stringify(obj.$attrs.friction));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0200] flingSpeedLimit: " + JSON.stringify(obj.$attrs.flingSpeedLimit));

      expect(obj.$attrs.space).assertEqual('20.00px');
      expect(obj.$attrs.initialIndex).assertEqual('5');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.On');
      expect(obj.$attrs.scrollBarWidth).assertEqual('5.00vp');
      expect(obj.$attrs.scrollBarColor).assertEqual('#FF000000');
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.chainAnimation).assertEqual(true);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(true);
      expect(obj.$attrs.fadingEdge).assertEqual(true);
      expect(obj.$attrs.friction).assertEqual(0.6);
      expect(obj.$attrs.flingSpeedLimit).assertEqual('5.00vp');
      console.info('[ArkUX_Stage_ArkList_ComponentTest_0200] END');
      done();
    });

    /* *
    * @tc.number: ArkUX_Stage_ArkList_ComponentTest_0300
    * @tc.name  : testArkListComponent.
    * @tc.desc  : Test default value for testing the arclist component.
    * @tc.level : Level 1
    * @tc.size  : MediumTest
    * @tc.type  : Function
    */
    it('ArkUX_Stage_ArkList_ComponentTest_0300', 0, async (done: Function) => {
      console.info('[ArkUX_Stage_ArkList_ComponentTest_0300] START');
      let strJson = getInspectorByKey('arclist02');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] space: " + JSON.stringify(obj.$attrs.space));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] initialIndex: " + JSON.stringify(obj.$attrs.initialIndex));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] scrollBar: " + JSON.stringify(obj.$attrs.scrollBar));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] scrollBarWidth: " + JSON.stringify(obj.$attrs.scrollBarWidth));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] scrollBarColor: " + JSON.stringify(obj.$attrs.scrollBarColor));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] cachedCount: " + JSON.stringify(obj.$attrs.cachedCount));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] chainAnimation: " + JSON.stringify(obj.$attrs.chainAnimation));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] enableScrollInteraction: " + JSON.stringify(obj.$attrs.enableScrollInteraction));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] fadingEdge: " + JSON.stringify(obj.$attrs.fadingEdge));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] friction: " + JSON.stringify(obj.$attrs.friction));
      console.info("[ArkUX_Stage_ArkList_ComponentTest_0300] flingSpeedLimit: " + JSON.stringify(obj.$attrs.flingSpeedLimit));

      expect(obj.$attrs.space).assertEqual('0.00px');
      expect(obj.$attrs.initialIndex).assertEqual('0');
      expect(obj.$attrs.scrollBar).assertEqual('BarState.Auto');
      expect(obj.$attrs.scrollBarWidth).assertEqual('4.00vp');
      expect(obj.$attrs.scrollBarColor).assertEqual('#FF000000');
      expect(obj.$attrs.cachedCount).assertEqual('1');
      expect(obj.$attrs.chainAnimation).assertEqual(false);
      expect(obj.$attrs.enableScrollInteraction).assertEqual(false);
      expect(obj.$attrs.fadingEdge).assertEqual(false);
      expect(obj.$attrs.friction).assertEqual(0.800000011920929);
      expect(obj.$attrs.flingSpeedLimit).assertEqual('4200.00vp');
      console.info('[ArkUX_Stage_ArkList_ComponentTest_0300] END');
      done();
    });
  })
}
