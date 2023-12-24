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
import router from '@ohos.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from '../Utils'

export default function AllName() {
  describe('AllName', function () {
    beforeEach(async function (done) {
      console.info("AllName beforeEach start");
      let options = {
        url: 'MainAbility/pages/TextApi/AllName',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AllName state pages:" + JSON.stringify(pages));
        if (!("AllName" == pages.name)) {
          console.info("get AllName pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push AllName page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AllName page error:" + err);
      }
      console.info("AllName beforeEach end");
      done();
    });
    afterEach(async function () {
      await Utils.sleep(1000);
      console.info("AllName after each called");
    });
    /**
     * @tc.number    AllName_0100
     * @tc.name      AllName_0100
     * @tc.desc      set api
     * @tc.level       Level 2
     * @tc.type
     * @tc.size
     */
    it('AllName_0100', 0, async function (done) {

      console.info('[AllName_0100] START');
      await Utils.sleep(2000);
      let text1 = getInspectorByKey('TextKeyAllName');
      let Obj1 = JSON.parse(text1);
      expect(Obj1.$type).assertEqual('Text');

      console.info('[AllName_0100] END');
      done();
    });




  })
}
