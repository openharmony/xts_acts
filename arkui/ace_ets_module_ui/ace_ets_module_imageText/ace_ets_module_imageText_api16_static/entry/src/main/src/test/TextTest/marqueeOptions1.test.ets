/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index.ets"
import { vp2px } from '@ohos.arkui.component';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, MouseButton, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function marqueeOptionsTest1() {
  describe('marqueeOptionsTest1', () => {
    beforeAll(() => {
      console.info("marqueeOptionsTest1 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api16.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("marqueeOptionsTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Text/marqueeOptions1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get marqueeOptionsTest1 state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get marqueeOptionsTest1 pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push marqueeOptionsTest1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push marqueeOptionsTest1 page error:" + err);
      }
      console.info("marqueeOptionsTest1 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("marqueeOptionsTest1 after each called");
    });
	
    /**
     * @tc.number marqueeOptionsTest1
     * @tc.name marqueeOptionsTest1_static_001
     * @tc.desc Return specified page by index value
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it('marqueeOptionsTest1_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[marqueeOptionsTest1_static_001] START');
      await CommonFunc.sleep(1000);
      let marqueeOptions = inspector.getInspectorByKey('MarqueeOptions');
      let marq = JSON.parseJsonElement(marqueeOptions).getElement('$attrs').getElement('marqueeOptions');
      console.info('marqueeOptionsTest1_static_001 -----' + JSON.stringifyJsonElement(marq));
      await CommonFunc.sleep(2000);
      console.info('marqueeOptionsTest1_static_001 -----22' + marq.getElement('start'));
      expect(marq.getBoolean('start')).assertTrue();
      expect(Math.abs(marq.getInteger('step') - vp2px(6)) <= 1).assertTrue();
      expect(marq.getInteger('loop') == -1).assertTrue();
      expect(marq.getInteger('delay') == 0).assertTrue();
      expect(marq.getBoolean('fadeout')).assertFalse();
      expect(marq.getString('startPolicy')).assertEqual('MarqueeStartPolicy.DEFAULT');
      expect(marq.getString('direction')).assertEqual('MarqueeDirection.DEFAULT');
      console.info('[marqueeOptionsTest1_static_001] END');
      done();
    });

    /**
     * @tc.number onMarqueeStateChangeTest
     * @tc.name onMarqueeStateChangeTest_static_001
     * @tc.desc Return specified page by index value
     * @tc.level Level 3
     * @tc.type
     * @tc.size
     */
    it('onMarqueeStateChangeTest_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info('[onMarqueeStateChangeTest_static_001] START');
      await CommonFunc.sleep(1000);
      let MarqueeState = inspector.getInspectorByKey('MarqueeState');
      await CommonFunc.sleep(2000);
      console.info('MarqueeState-----' + JSON.parseJsonElement(MarqueeState).getElement('$attrs').getElement('content'));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(MarqueeState).getElement('$attrs').getString('content')).assertEqual('START');
      console.info('[onMarqueeStateChangeTest_static_001] END');
      done();
    });
  })
}