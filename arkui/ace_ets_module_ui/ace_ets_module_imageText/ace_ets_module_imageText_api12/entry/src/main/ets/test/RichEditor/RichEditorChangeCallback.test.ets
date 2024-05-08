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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import Utils from '../../MainAbility/utils/Common';
import { Driver, ON } from '@ohos.UiTest';


export default function RichEditorChangeCallback() {
  describe('RichEditorChangeCallback', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorChangeCallback beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditor/RichEditorChangeCallback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorChangeCallback state success " + JSON.stringify(pages));
        if (!("RichEditorChangeCallback" == pages.name)) {
          console.info("get RichEditorChangeCallback state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push RichEditorChangeCallback page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorChangeCallback page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RichEditorChangeCallback after each called");
    });


    /*
    * @tc.number      RichEditorChangeCallback_001
    * @tc.name        RichEditorChangeCallback_001
    * @tc.desc        Test RichEditor, trigger onWillChange before text changes, and trigger onDidChange after text changes
    * @tc.level       Level 2
    */
    it('RichEditorChangeCallback_001', 0, async (done: Function) => {
      console.info('[RichEditorChangeCallback_001] START');
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('RichEditorChangeCallback_text');
      let obj1 = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[RichEditorChangeCallback_001] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('onWillChangeonDidChange');

      let strJson2 = getInspectorByKey('RichEditorChangeCallback_text2');
      let obj2 = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[RichEditorChangeCallback_001] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('test');

      console.info('[RichEditorChangeCallback_001] END');
      done();
    });
  })
}


