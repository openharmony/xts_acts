/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import CommonFunc from '../../../MainAbility/common/Common';
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function richEditorApi() {
  describe('richEditorApi', function () {
    beforeEach(async function (done) {
      console.info("richEditorApi beforeEach start");
      let options = {
        url: 'MainAbility/pages/richEditor/richEditorApi/richEditorApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get richEditorApi state pages:" + JSON.stringify(pages));
        if (!("richEditorApi" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push richEditorApi page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi page error:" + err);
      }
      console.info("richEditorApi beforeEach end");
      done();
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("richEditorApi after each called");
    });
    /**
     * @tc.number    SUB_ACE_RICHEDITOR_RICHEDITORAPI_0100
     * @tc.name      testRichEditor
     * @tc.desc      set api
     */
    it('testRichEditor_0100', 0, async function (done) {
      console.info('[testRichEditor_0100] START');
      await CommonFunc.sleep(2000);

      let text1 = getInspectorByKey('richEditorApi_text1');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$type).assertEqual('Text');

      console.info('[testRichEditor_0100] END');
      done();
    });

  })
}
