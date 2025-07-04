/**
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
import { describe, beforeAll, it, expect, Level, beforeEach, afterEach } from "../../../../hypium/index"
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function ContentTypeTest2() {
  describe('ContentTypeTest2', () => {
    beforeAll(() => {
      console.info("ContentTypeTest2 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api18.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("ContentTypeTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/ContentType2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ContentTypeTest2 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ContentTypeTest2 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ContentTypeTest2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ContentTypeTest2 page error:" + err);
      }
      console.info("ContentTypeTest2 beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ContentTypeTest2 after each called");
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest2_0010
     * @tc.name      ContentTypeTest2_static_0010
     * @tc.desc      set textInput ContentType: FLIGHT_NUMBER
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest2_static_0010', 0, async (done: ()=>void) => {
      console.info('ContentTypeTest2_0010 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_FLIGHT_NUMBER');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.FLIGHT_NUMBER');
      console.info('[ContentTypeTest2_0010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest2_0020
     * @tc.name      ContentTypeTest2_static_0020
     * @tc.desc      set textInput ContentType: LICENSE_NUMBER
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest2_static_0020', 0, async (done: ()=>void) => {
      console.info('ContentTypeTest2_0020 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_LICENSE_NUMBER');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.LICENSE_NUMBER');
      console.info('[ContentTypeTest2_0020] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest2_0030
     * @tc.name      ContentTypeTest2_static_0030
     * @tc.desc      set textInput ContentType: LICENSE_FILE_NUMBER
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest2_static_0030', 0, async (done: ()=>void) => {
      console.info('ContentTypeTest2_0030 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_LICENSE_FILE_NUMBER');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.LICENSE_FILE_NUMBER');
      console.info('[ContentTypeTest2_0030] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest2_0040
     * @tc.name      ContentTypeTest2_static_0040
     * @tc.desc      set textInput ContentType: LICENSE_PLATE
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest2_static_0040', 0, async (done: ()=>void) => {
      console.info('ContentTypeTest2_0040 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_LICENSE_PLATE');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.LICENSE_PLATE');
      console.info('[ContentTypeTest2_0040] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest2_0050
     * @tc.name      ContentTypeTest2_static_0050
     * @tc.desc      set textInput ContentType: ENGINE_NUMBER
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest2_static_0050', 0, async (done: ()=>void) => {
      console.info('ContentTypeTest2_0050 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_ENGINE_NUMBER');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.ENGINE_NUMBER');
      console.info('[ContentTypeTest2_0050] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest2_0060
     * @tc.name      ContentTypeTest2_static_0060
     * @tc.desc      set textInput ContentType: LICENSE_CHASSIS_NUMBER
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest2_static_0060', 0, async (done: ()=>void) => {
      console.info('ContentTypeTest2_0060 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_LICENSE_CHASSIS_NUMBER');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.LICENSE_CHASSIS_NUMBER');
      console.info('[ContentTypeTest2_0060] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_ContentTypeTest2_0070
     * @tc.name      ContentTypeTest2_static_0070
     * @tc.desc      set Illegal value about textInput ContentType: UNDEFINED
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ContentTypeTest2_static_0070', 0, async (done: ()=>void) => {
      console.info('ContentTypeTest2_0070 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ContentType_UNDEFINED');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ContentTypeTest2_0070] component obj is: " + JSON.stringify(obj.getElement('$attrs')));
      expect(obj.getElement('$attrs').getString('contentType')).assertEqual('TextContentType.UNSPECIFIED');
      console.info('[ContentTypeTest2_0070] END');
      done();
    });
  })
}

