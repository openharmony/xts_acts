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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@system.router';
import CommonFunc from "../../../MainAbility/common/Common";
import { MessageManager,Callback } from '../../../MainAbility/common/MessageManager';
export default function stackMarginChange() {
  describe('stackMarginChangeTest', function () {
    beforeEach(async function (done) {
      let options = {
        uri: 'MainAbility/pages/Stack/Stack_change/stackMarginChange',
      }
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackMarginChange state success " + JSON.stringify(pages));
        if (!("stackMarginChange" == pages.name)) {
          console.info("get stackMarginChange state success " + JSON.stringify(pages.name));
          let result = await router.push(options)
          console.info("push stackMarginChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackMarginChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
      done()
    });
    afterEach(async function () {
      await CommonFunc.sleep(1000);
      console.info("stackMarginChange after each called");
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0100
     * @tc.name      testStackMarginAlignContentTopStart
     * @tc.desc      Set stack's  margin 20  and alignContent mode 'TopStart'.
     */
    it('testStackMarginAlignContentTopStart', 0, async function (done) {
      console.info('new testStackMarginAlignContentTopStart START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.TopStart});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(stackMarginKey01.left) .assertEqual (stackMarginKey.left)
      expect(stackMarginKey01.top) .assertEqual (stackMarginKey.top)
      expect(Math.round(stackMarginKey.right - stackMarginKey01.right)).assertEqual(vp2px(100))
      expect(Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)).assertEqual(vp2px(100))
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.TopStart')
      console.info('new testStackMarginAlignContentTopStart END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0200
     * @tc.name      testStackMarginAlignContentTop
     * @tc.desc       Set stack's  margin 20  and alignContent mode 'Top'.
     */
    it('testStackMarginAlignContentTop', 0, async function (done) {
      console.info('new testStackMarginAlignContentTop START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.Top});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.round(stackMarginKey01.left - stackMarginKey.left)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey.right - stackMarginKey01.right)).assertEqual(vp2px(50))
      expect(stackMarginKey01.top) .assertEqual (stackMarginKey.top)
      expect(Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)).assertEqual(vp2px(100))
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Top')
      console.info('new testStackMarginAlignContentTop END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0300
     * @tc.name      testStackMarginAlignContentTopEnd
     * @tc.desc       Set stack's  margin 20  and alignContent mode 'TopEnd'.
     */
    it('testStackMarginAlignContentTopEnd', 0, async function (done) {
      console.info('new testStackMarginAlignContentTopEnd START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.TopEnd});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.round(stackMarginKey01.left - stackMarginKey.left)).assertEqual(vp2px(100))
      expect(stackMarginKey01.right) .assertEqual (stackMarginKey.right)
      expect(stackMarginKey01.top) .assertEqual (stackMarginKey.top)
      expect(Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)).assertEqual(vp2px(100))
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.TopEnd')
      console.info('new testStackMarginAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0400
     * @tc.name      testStackMarginAlignContentStart
     * @tc.desc       Set stack's  margin 20  and alignContent mode 'START'.
     */
    it('testStackMarginAlignContentStart', 0, async function (done) {
      console.info('new testStackMarginAlignContentStart START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.Start});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(stackMarginKey01.left) .assertEqual (stackMarginKey.left)
      expect(Math.round(stackMarginKey.right - stackMarginKey01.right)).assertEqual(vp2px(100))
      expect(Math.round(stackMarginKey01.top - stackMarginKey.top)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Start')
      console.info('new testStackMarginAlignContentStart END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0500
     * @tc.name      testStackMarginAlignContentCenter
     * @tc.desc      Set stack's  margin 20  and alignContent mode 'Center'.
     */
    it('testStackMarginAlignContentCenter', 0, async function (done) {
      console.info('new testStackMarginAlignContentCenter START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.Center});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.round(stackMarginKey01.left - stackMarginKey.left)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey.right - stackMarginKey01.right)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey01.top - stackMarginKey.top)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Center')
      console.info('new testStackMarginAlignContentCenter END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0600
     * @tc.name      testStackMarginAlignContentEnd
     * @tc.desc       Set stack's  margin 20  and alignContent mode 'End'.
     */
    it('testStackMarginAlignContentEnd', 0, async function (done) {
      console.info('new testStackMarginAlignContentEnd START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.End});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.round(stackMarginKey01.left - stackMarginKey.left)).assertEqual(vp2px(100))
      expect(stackMarginKey01.right) .assertEqual (stackMarginKey.right)
      expect(Math.round(stackMarginKey01.top - stackMarginKey.top)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.End')
      console.info('new testStackMarginAlignContentEnd END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0700
     * @tc.name      testStackMarginAlignContentBottomStart
     * @tc.desc       Set stack's  margin 20  and alignContent mode 'BottomStart'.
     */
    it('testStackMarginAlignContentBottomStart', 0, async function (done) {
      console.info('new testStackMarginAlignContentBottomStart START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.BottomStart});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(stackMarginKey01.left) .assertEqual (stackMarginKey.left)
      expect(Math.round(stackMarginKey.right - stackMarginKey01.right)).assertEqual(vp2px(100))
      expect(Math.round(stackMarginKey01.top - stackMarginKey.top)).assertEqual(vp2px(100))
      expect(stackMarginKey01.bottom) .assertEqual (stackMarginKey.bottom)
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.BottomStart')
      console.info('new testStackMarginAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0800
     * @tc.name      testStackMarginAlignContentBottom
     * @tc.desc       Set stack's  margin 20  and alignContent mode 'Bottom'.
     */
    it('testStackMarginAlignContentBottom', 0, async function (done) {
      console.info('new testStackMarginAlignContentBottom START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.Bottom});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.round(stackMarginKey01.left - stackMarginKey.left)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey.right - stackMarginKey01.right)).assertEqual(vp2px(50))
      expect(Math.round(stackMarginKey01.top - stackMarginKey.top)).assertEqual(vp2px(100))
      expect(stackMarginKey01.bottom) .assertEqual (stackMarginKey.bottom)
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.Bottom')
      console.info('new testStackMarginAlignContentBottom END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_STACK_ALIGNMARGINCHANGED_0900
     * @tc.name      testStackMarginAlignContentBottomEnd
     * @tc.desc       Set stack's  margin 20  and alignContent mode 'BottomEnd'.
     */
    it('testStackMarginAlignContentBottomEnd', 0, async function (done) {
      console.info('new testStackMarginAlignContentBottomEnd START');
      globalThis.value.message.notify({name:'alignContent', value:Alignment.BottomEnd});
      globalThis.value.message.notify({name:'margin', value:20});
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('stackMarginKey');
      let obj = JSON.parse(strJson);
      let stackMarginKey = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01 = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.round(stackMarginKey01.left - stackMarginKey.left)).assertEqual(vp2px(100))
      expect(stackMarginKey01.right) .assertEqual (stackMarginKey.right)
      expect(Math.round(stackMarginKey01.top - stackMarginKey.top)).assertEqual(vp2px(100))
      expect(stackMarginKey01.bottom) .assertEqual (stackMarginKey.bottom)
      expect(Math.round(stackMarginKey01.right - stackMarginKey01.left)).assertEqual(vp2px(200))
      expect(obj.$type).assertEqual('Stack')
      expect(obj.$attrs.alignContent).assertEqual('Alignment.BottomEnd')
      console.info('new testStackMarginAlignContentBottomEnd END');
      done();
    });
  })
}