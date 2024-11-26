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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function SearchAutoDisableTest() {
  describe('SearchAutoDisableTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SearchAutoDisableTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/autoDisable',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SearchAutoDisableTest state pages: " + JSON.stringify(pages));
        if (!("autoDisable" == pages.name)) {
          console.info("get SearchAutoDisableTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SearchAutoDisableTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SearchAutoDisableTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

     /**
     * @tc.number    SUB_ACE_SearchAutoDisable_0010
     * @tc.name      SUB_ACE_SearchAutoDisable_0010
     * @tc.desc      test autoDisable: false
     * @tc.level:    Level 2
     * @tc.type : 
     * @tc.size :
     */
    it('SearchAutoDisableTest_0010', 0, async (done: Function) => {
      console.info('SearchAutoDisableTest_0010 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('SearchAutoDisable_1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SearchAutoDisableTest_0010] component obj is: " + JSON.stringify(obj));
      console.info("[SearchAutoDisableTest_0010] searchButton: " + JSON.stringify(obj.$attrs.searchButton));
      expect(obj.$attrs.searchButton).assertEqual('SEARCH');
      console.info('[SearchAutoDisableTest_0010] END');
      done();
    });
  })
}
