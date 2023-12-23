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
import router from '@system.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager, Callback } from '../../../MainAbility/common/MessageManager';


export default function Stack_Text() {
  describe('Stack_Text', function () {
    beforeEach(async function (done) {
      console.info("Stack_Text beforeEach start");
      let options = {
        uri: 'MainAbility/pages/Stack/Stack_Text/Stack_Text',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Stack_Text state pages: " + JSON.stringify(pages));
        if (!("Stack_Text" == pages.name)) {
          console.info("get Stack_Text state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push Stack_Text page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_Text page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /* *
      * @tc.number: Stack_Text_001
      * @tc.name  : Stack_Text_001
      * @tc.desc  : set api
      * @tc.level : Level 2
      * @tc.type : 
      * @tc.size : 
      */
    it('Stack_Text_001', 0, async function (done) {

      console.info('[Stack_Text_001] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('Stack_Text');
      let obj1 = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_001] Stack_Text obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('Stack_TextInput');
      let obj = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      console.info("[Stack_Text_001] Stack_TextInput obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);

      expect(obj1.$type).assertEqual('Text');
      expect(obj.$attrs.type).assertEqual('InputType.USER_NAME');

      console.info('[Stack_Text_001] END');
      done();
    });




  })
}
