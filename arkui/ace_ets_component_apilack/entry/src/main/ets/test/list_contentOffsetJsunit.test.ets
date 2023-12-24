
/*
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
 

import events_emitter from '@ohos.events.emitter';
import router from '@system.router';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
import Utils from './Utils.ets'

export default function ListContentOffsetJsunit() {
  describe('ListContentOffsetJsunit', function () {
    beforeEach(async function (done) {
      console.info("ListContentOffsetJsunit beforeEach start");
      let options = {
        uri: 'MainAbility/pages/list_contentOffset',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ListContentOffsetJsunit state pages:" + JSON.stringify(pages));
        if (!("list_contentOffset" == pages.name)) {
          console.info("get ListContentOffsetJsunit state pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push ListContentOffsetJsunit success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ListContentOffsetJsunit page error:" + err);
      }
      done();
    });
    it('ListContentOffsetJsunit_0100', 0, async function (done) {
      await Utils.sleep(1000);
      console.info('ListContentOffsetJsunit_0100 START');
      let strcontent = getInspectorByKey('ListContentOffsetText01');
      let obj = JSON.parse(strcontent);
      await Utils.sleep(1000);
      console.info('ListContentOffsetJsunit_0100 component obj is: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('abc');
      console.info('ListContentOffsetJsunit_0100 END')
      done();
    });

  })
}