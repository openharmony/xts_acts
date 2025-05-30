/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TextDecorationStyleTest() {
  describe('TextDecorationStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextDecorationStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextDecorationStyleTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextDecorationStyleTest state success " + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        if (!("TextDecorationStyleTest" == pages.name)) {
          console.info("get TextDecorationStyleTest state success " + JSON.stringify(pages.name));
          await CommonFunc.sleep(2000);
          console.info("push TextDecorationStyleTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextDecorationStyleTest page error: " + err);
      }
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0001
    * @tc.name         TextDecorationStyleTest0001
    * @tc.desic        test Text TextDecorationStyle DOTTED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0001', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0001 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleTextDOTTED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0001] end");
      done();
    });
    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0002
    * @tc.name         TextDecorationStyleTest0002
    * @tc.desic        test Text TextDecorationStyle DASHED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0002', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0002 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleTextDASHED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0002] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0003
    * @tc.name         TextDecorationStyleTest0003
    * @tc.desic        test Search TextDecorationStyle DOTTED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0003', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0003 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleSearchDOTTED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0003] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0004
    * @tc.name         TextDecorationStyleTest0004
    * @tc.desic        test Search TextDecorationStyle DASHED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0004', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0004 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleSearchDASHED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0004] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0005
    * @tc.name         TextDecorationStyleTest0005
    * @tc.desic        test TextArea TextDecorationStyle DOTTED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0005', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0005 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleTextAreaDOTTED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0005] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0006
    * @tc.name         TextDecorationStyleTest0006
    * @tc.desic        test TextArea TextDecorationStyle DASHED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0006', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0006 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleTextAreaDASHED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0006] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0007
    * @tc.name         TextDecorationStyleTest0007
    * @tc.desic        test TextInput TextDecorationStyle DOTTED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0007', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0007 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleTextInputDOTTED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DOTTED');
      console.info("[TextDecorationStyleTest0007] end");
      done();
    });

    /*
    * @tc.number       SUB_ACE_BASIC_ETS_API_0008
    * @tc.name         TextDecorationStyleTest0008
    * @tc.desic        test TextInput TextDecorationStyle DASHED
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        0
     */
    it('TextDecorationStyleTest0008', Level.LEVEL0, async (done: Function) => {
      console.info('TextDecorationStyleTest0008 START');
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('TextDecorationStyleTextInputDASHED');
      let decoration:TextDecorationOptions = JSON.parse(JSON.parse(strJson).$attrs.decoration);
      console.log('TextDecorationStyle-----' + JSON.stringify(decoration));
      console.log('TextDecorationStyle-----' + decoration.style);
      expect(''+decoration.style).assertEqual('TextDecorationStyle.DASHED');
      console.info("[TextDecorationStyleTest0008] end");
      done();
    });
  })
}