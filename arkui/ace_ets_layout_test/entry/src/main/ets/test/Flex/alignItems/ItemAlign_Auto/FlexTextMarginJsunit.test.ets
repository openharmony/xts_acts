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
import {MessageManager,Callback} from '../../../../MainAbility/common/MessageManager';
export default function flexTextMargin_AutoJsunit() {

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
        uri: 'MainAbility/pages/Flex/alignItems/ItemAlign_Auto/FlexTextMargin',
      }
      try {
        router.clear();
        await sleep(1);
        let pages = router.getState();
        console.info("get FlexTextMargin state success " + JSON.stringify(pages));
        if (!("FlexTextMargin" == pages.name)) {
          console.info("get FlexTextMargin state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push FlexTextMargin page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FlexTextMargin page error " + JSON.stringify(result));
      }
      await sleep(2)
      done()
    });
    afterEach(async function () {
      await sleep(1)
      console.info("FlexTextMargin after each called");
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_AUTO_1300
     * @tc.name      ItemAlign_Auto_TextMargin
     * @tc.desc      aceFlexAlignItemTest
     */
    it('ItemAlign_Auto_TextMargin001', 0, async function (done) {
      console.info('new ItemAlign_Auto_TextMargin001 START');
      globalThis.value.message.notify({name:'margin', value:10});
      let strJson1 = getInspectorByKey('flexTextMargin01');
      let obj1 = JSON.parse(strJson1);
      let textMargin01 = CommonFunc.getComponentRect('textMargin01');
      let textMargin02 = CommonFunc.getComponentRect('textMargin02');
      let textMargin03 = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01 = CommonFunc.getComponentRect('flexTextMargin01');
      expect(textMargin01.left - flexTextMargin01.left).assertEqual(vp2px(10))
      expect(textMargin02.left).assertEqual(textMargin01.right)
      expect(textMargin03.right).assertLess(flexTextMargin01.right)
      
      expect(textMargin01.top).assertEqual(textMargin02.top)
      expect(textMargin02.top).assertEqual(textMargin03.top)
      expect(textMargin02.top).assertEqual(flexTextMargin01.top)

      expect(textMargin01.bottom - textMargin01.top).assertEqual(vp2px(70))
      expect(textMargin02.bottom - textMargin02.top).assertEqual(vp2px(100))
      expect(textMargin03.bottom - textMargin03.top).assertEqual(vp2px(150))
      expect(textMargin01.right - textMargin01.left).assertEqual(vp2px(170))
      expect(textMargin02.right - textMargin02.left).assertEqual(vp2px(150))
      expect(textMargin03.right - textMargin03.left).assertEqual(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Auto')
      console.info('new ItemAlign_Auto_TextMargin001 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_FLEXALIGNITEMS_AUTO_1400
     * @tc.name      ItemAlign_Auto_TextMargin
     * @tc.desc      aceFlexAlignItemTest
     */
    it('ItemAlign_Auto_TextMargin002', 0, async function (done) {
      console.info('new ItemAlign_Auto_TextMargin002 START');
      globalThis.value.message.notify({name:'margin', value:30});
      let strJson1 = getInspectorByKey('flexTextMargin01');
      let obj1 = JSON.parse(strJson1);
      let textMargin01 = CommonFunc.getComponentRect('textMargin01');
      let textMargin02 = CommonFunc.getComponentRect('textMargin02');
      let textMargin03 = CommonFunc.getComponentRect('textMargin03');
      let flexTextMargin01 = CommonFunc.getComponentRect('flexTextMargin01');
      expect(textMargin01.left - flexTextMargin01.left).assertEqual(vp2px(30))
      expect(textMargin02.left).assertEqual(textMargin01.right)
      expect(textMargin03.right).assertEqual(flexTextMargin01.right)
      expect(textMargin01.top).assertEqual(textMargin02.top)
      expect(textMargin02.top).assertEqual(textMargin03.top)
      expect(textMargin02.top).assertEqual(flexTextMargin01.top)

      expect(textMargin01.bottom - textMargin01.top).assertEqual(vp2px(50))
      expect(textMargin02.bottom - textMargin02.top).assertEqual(vp2px(100))
      expect(textMargin03.bottom - textMargin03.top).assertEqual(vp2px(150))
      expect(textMargin01.right - textMargin01.left).assertLess(vp2px(150))
      expect(textMargin02.right - textMargin02.left).assertLess(vp2px(150))
      expect(textMargin03.right - textMargin03.left).assertLess(vp2px(150))
      expect(obj1.$attrs.constructor.direction).assertEqual('FlexDirection.Row')
      expect(obj1.$attrs.constructor.alignItems).assertEqual('ItemAlign.Auto')
      console.info('new ItemAlign_Auto_TextMargin002 END');
      done();
    });
  })
}
