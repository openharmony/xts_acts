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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level, beforeAll } from "../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
import inspector from '@ohos.arkui.inspector'
let domain: number = 0x0000;

export default function TextMenuType() {
  describe('TextMenuType', () => {
    beforeAll(() => {
      console.info("StyledStringUrl beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextMenuType beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextMenuType',
      }
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        // console.info("get TextMenuType state pages: " + JSON.stringify(pages));
        if (!("TextMenuType" == pages.name)) {
          // console.info("get TextMenuType state pages.name: " + JSON.stringify(pages.name));
          // let result = await router.push(options);
          router.pushUrl(options)
          await CommonFunc.sleep(2000);
          // console.info("push TextMenuType success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextMenuType page error: " + err);
        expect().assertFail();
      }
    });

     /**
     * @tc.number    SUB_ACE_TextMenuType_static_0100
     * @tc.name      TextMenuType_static_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextMenuType_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('TextMenuType_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textMenuType1');
      let obj= JSON.parseJsonElement(strJson);
      // console.info("[TextMenuType_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$type')).assertEqual('Text');
      console.info('[TextMenuType_static_0100] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_TextMenuType_static_0200
     * @tc.name      TextMenuType_static_0200
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('TextMenuType_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('TextMenuType_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('textMenuType2');
      let obj= JSON.parseJsonElement(strJson);
      console.info("[TextMenuType_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$type')).assertEqual('Text');
      console.info('[TextMenuType_static_0200] END');
      done();
    });
  })
}

