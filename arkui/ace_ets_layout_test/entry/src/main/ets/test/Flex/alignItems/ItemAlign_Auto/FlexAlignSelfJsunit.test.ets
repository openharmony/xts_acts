/*
 * Copyright (c) 2020-2030 iSoftStone Information Technology (Group) Co.,Ltd.
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

// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from "../../../../MainAbility/common/Common";

export default function flexAlignSelf_AutoJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }

  describe('flexItemAlignAutoTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/FlexAlignSelf',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get FlexSecond state success " + JSON.stringify(pages));
        if (!("FlexSecond" == pages.name)) {
          console.info("get FlexSecond state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexSecond page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexSecond page error " + JSON.stringify(result));
      }
      await sleep(2)
      done()
    });

    afterEach(async function () {
      await sleep(1)
      console.info("FlexSecond after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_AUTO_1200
     * @tc.name      ItemAlign_Auto_FlexAlignSelf
     * @tc.desc      aceFlexAlignItemTest
     */
    it('ItemAlign_Auto_FlexAlignSelf001', 0, async function (done) {
      console.info('new ItemAlign_Auto_FlexAlignSelf001 START');
      let strJson1 = getInspectorByKey('flexAlignSelf');
      let obj1 = JSON.parse(strJson1);
      let strJson2 = getInspectorByKey('textAlignSelf01');
      let obj2 = JSON.parse(strJson2);
      let textAlignSelf01 = CommonFunc.getComponentRect('textAlignSelf01');
      let textAlignSelf02 = CommonFunc.getComponentRect('textAlignSelf02');
      let textAlignSelf03 = CommonFunc.getComponentRect('textAlignSelf03');
      let flexAlignSelf01 = CommonFunc.getComponentRect('flexAlignSelf');
      expect(textAlignSelf01.left).assertEqual(flexAlignSelf01.left)
      expect(textAlignSelf01.right).assertEqual(textAlignSelf02.left)
      expect(textAlignSelf01.top).assertEqual(textAlignSelf02.top)
      expect(textAlignSelf02.top).assertEqual(textAlignSelf03.top)
      expect(textAlignSelf01.bottom).assertEqual(flexAlignSelf01.bottom)

      expect(textAlignSelf01.bottom - textAlignSelf01.top).assertEqual(vp2px(50))
      expect(textAlignSelf01.right - textAlignSelf01.left).assertEqual(vp2px(150))
      expect(textAlignSelf02.bottom - textAlignSelf02.top).assertEqual(vp2px(100))
      expect(textAlignSelf02.right - textAlignSelf02.left).assertEqual(vp2px(150))
      expect(textAlignSelf03.bottom - textAlignSelf03.top).assertEqual(vp2px(150))
      expect(textAlignSelf03.right - textAlignSelf03.left).assertEqual(vp2px(150))

      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Auto')
      expect(obj2.$attrs.alignSelf).assertEqual("ItemAlign.End")
      console.info('new ItemAlign_Auto_FlexAlignSelf001 END');
      done();
    });
  })
}
