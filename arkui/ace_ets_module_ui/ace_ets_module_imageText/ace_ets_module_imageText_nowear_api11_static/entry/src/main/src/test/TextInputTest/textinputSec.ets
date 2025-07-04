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
import {
  $r,
  Resource
} from '@ohos.arkui.component'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import events_emitter from '@ohos.events.emitter';
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
function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

async function forKey(Key: string, text: string, icon?: ESObject1) {
  try {
    let backData: events_emitter.EventData = {
      data: {
        "type": Key,
        "text": text,
        "icon": JSON.stringify(icon),
      } as Record<String,Object>
    } as events_emitter.EventData
    let backEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    console.info("start send emitKey");
    events_emitter.emit(backEvent, backData);
    console.info("backData :====>" + JSON.stringify(backData));
  } catch (err) {
    console.info("emit emitKey  err: " + JSON.stringify(err));
  }
  await sleep(2000)
}
interface ESObject1{
  offIconSrc: string | Resource | null | undefined | number;
  onIconSrc: string | Resource | null | undefined | number;
}
export default function textinputSec() {
  describe('textinputSec', () :void=> {
    beforeAll(() => {
      console.info("textinputSec beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.nowear.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("textinputSec beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/TextInput/TextinputSec",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textinputSec state pages:" + "");
        if (!("TextClockApi" == pages.name)) {
          console.info("get textinputSec pages.name:" + "");
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push textinputSec page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push textinputSec page error:" + err);
      }
      console.info("textinputSec beforeEach end");
    });
    
    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0100
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Set the ShowOutline property of the Textinput component to true
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolTrue", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(true);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0200
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Set the ShowOutline property of the Textinput component to false
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolFalse", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(false);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0300
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Set the ShowOutline property of the Textinput component to null
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrNull", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        await sleep(5000)
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(false);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0400
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Set the ShowOutline property of the Textinput component to undefined
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrUndefined", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(false);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0500
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Set the ShowOutline property of the Textinput component to ""
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrStr", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(false);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0600
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Continuously set the showOutline property of the Textinput component and all are valid values
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolFalse", "");
      await forKey("BoolTrue", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(true);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0700
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Continuously set the showOutline property of the Textinput component, with parameters
     *               first normal and then abnormal
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolTrue", "");
      await forKey("BoolErrStr", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(false);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0800
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Continuously set the showOutline property of the Textinput component,
     *               with parameters that are abnormal first and then normal
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrStr", "");
      await forKey("BoolTrue", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(true);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowUnderline_0900
     * @tc.name Configure whether Textinput text input displays underscores
     * @tc.desc Set the ShowOutline property of the Textinput component to 1
     */
    it('ArkUX_Stage_TextInput_ShowUnderline_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("BoolErrNum", "1");
      await sleep(2000)
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 obj $attrs.showUnderline :' + JSON.stringify(obj.getElement('$attrs').getString('showUnderline')));
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(false);
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0100
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to string type 'string'
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", "string");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0100 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0100 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('string');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('string');

        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0200
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to undefined
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "undefined");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0200 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0200 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0300
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to number type 10
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "10");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0300 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0300 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0400
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to the resource reference
     *               type $r("app. string. TextInput_ShowError_test")
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      try {
        let strJson = inspector.getInspectorByKey('TextInputResources');
        console.info('ArkUX_Stage_TextInput_ShowError_0400 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0400 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('string');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('string');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0500
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to ''
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", "");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0500 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowUnderline_0500 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0600
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to null
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "null");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0600 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0600 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0700
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to -1
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextNum", "-1");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0700 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0700 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0800
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to "string",
     *               and then set the parameter to "showerror" again
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", "string");
      await forKey("TextStr", "showError");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0800 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0800 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('showError');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('showError');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_0900
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to 'string' and
     *               set the parameter to null again
     */
    it('ArkUX_Stage_TextInput_ShowError_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextStr", "string");
      await forKey("TextErr", "null");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_0900 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_0900 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_ShowError_1000
     * @tc.name Textinput component error state style display
     * @tc.desc Set the TextInput component ShowError property parameter to 'string' and
     *               set the parameter to null again
     */
    it('ArkUX_Stage_TextInput_ShowError_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      await forKey("TextErr", "null");
      await forKey("TextStr", "string");
      try {
        let strJson = inspector.getInspectorByKey('TextInput');
        console.info('ArkUX_Stage_TextInput_ShowError_1000 START :' + JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.showError :' + JSON.stringify(obj.getElement('$attrs').getString('showError')));
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.showErrorText :' + JSON.stringify(obj.getElement('$attrs').getString('showErrorText')));
        console.info('ArkUX_Stage_TextInput_ShowError_1000 obj $attrs.errorText :' + JSON.stringify(obj.getElement('$attrs').getString('errorText')));

        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(true);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('string');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('string');
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_ShowError_1000 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0100
     * @tc.name Set Password Type Image Source
     * @tc.desc Set password type, image source verification, TextInput component, PasswordIcon property
     *               parameter, and separately set onIconSrc to obtain results
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r("app.media.ohos_app_bar_fa"),
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_app_bar_fa").id.toString() + ".svg")) != -1).assertTrue();
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0200
     * @tc.name Set Password Type Image Source
     * @tc.desc Set password type, image source verification, TextInput component, PasswordIcon property
     *               parameter, and separately set offIconSrc to obtain results
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        offIconSrc: $r("app.media.ohos_app_bar_back"),
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0300
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify the obtained results of setting the PasswordIcon property parameter of the TextInput
     *               component ({onIconSrc: $r ('app. media. ohos_correct '), offIconSrc: $r ('app. media. ohos_close')})
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r("app.media.ohos_correct"),
        offIconSrc: $r("app.media.ohos_close"),
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0400
     * @tc.name Set Password Type Image Source
     * @tc.desc Validate the result of setting the PasswordIcon property parameter to null
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: null,
        offIconSrc: null,
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");

        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0500
     * @tc.name Set Password Type Image Source
     * @tc.desc Validate the result of setting the PasswordIcon property parameter to undefined
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: undefined,
        offIconSrc: undefined,
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0600
     * @tc.name Set Password Type Image Source
     * @tc.desc Validate the result of setting the PasswordIcon property parameter to ""
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: "",
        offIconSrc: "",
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0700
     * @tc.name Set Password Type Image Source
     * @tc.desc Validate the result of setting the PasswordIcon property parameter to 123
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: 123,
        offIconSrc: 123,
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0800
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify and set the TextInput component PasswordIcon property parameter onIconSrc as normal
     *               value, and offIconSrc as outlier
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r('app.media.ohos_correct'),
        offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0800 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_0900
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify and set the TextInput component PasswordIcon property parameter onIconSrc as
     *               outlier and offIconSrc as normal value
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: null, offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();

        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_0900 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1000
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify the obtained results of continuously setting the PasswordIcon property parameter of
     *               the TextInput component to normal values
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1000', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: $r('app.media.ohos_app_bar_fa'), offIconSrc: $r('app.media.ohos_app_bar_back')
      }
      await forKey("passWordIcon", "", passwordIcon);
      await sleep(1000)
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_app_bar_fa").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1000 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1100
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify the result of obtaining outlier after continuously setting the PasswordIcon property
     *               parameter of TextInput component to normal value
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1100', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: null, offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1100 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1200
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify that the parameter of the PasswordIcon property of the TextInput component is
     *               set to outlier and then to the normal value
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1200', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: null, offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.ohos_correct").id.toString() + ".svg")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_close").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1300
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify that the parameter onIconSrc of the PasswordIcon property of the TextInput component is set
     *               to the normal value continuously, and that the onIconSrc is set to the outlier, then the
     *               onIconSrc is set to the outlier, and the offIconSrc is set to the normal value
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1300', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIcon);
      passwordIcon = {
        onIconSrc: null, offIconSrc: $r('app.media.ohos_app_bar_back')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1200 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.ohos_app_bar_back").id.toString() + ".svg")) != -1).assertTrue();
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1300 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1400
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify that the parameter of the PasswordIcon property of the TextInput component is set to
     *               the normal value continuously, and then the result is obtained when only one parameter is passed
     *               and it is an outlier
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1400', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r('app.media.ohos_correct'), offIconSrc: $r('app.media.ohos_close')
      }
      await forKey("passWordIcon", "", passwordIcon);
      let passwordIconSec: ESObject1 = {
        onIconSrc: null
      }
      await forKey("passWordIcon", "", passwordIconSec);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("SYS_SHOW_PASSWORD_SVG");
        expect(Icon.getElement('offIconSrc')).assertEqual("SYS_HIDE_PASSWORD_SVG");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1400 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1500
     * @tc.name Set Password Type Image Source
     * @tc.desc Verify the result obtained by adding new properties to the TextInput component without setting it
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1500', Level.LEVEL1, async (done: ()=>void) => {
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual(983328);
        expect(Icon.getElement('offIconSrc')).assertEqual(983327);
        expect(obj.getElement('$attrs').getString('showErrorText')).assertEqual(false);
        expect(obj.getElement('$attrs').getString('errorText')).assertEqual('');
        expect(obj.getElement('$attrs').getString('showError')).assertEqual('undefined');
        expect(obj.getElement('$attrs').getString('showUnderline')).assertEqual(false);

        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1500 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1600
     * @tc.name Set Password Type Image Source
     * @tc.desc Set password type, image source verification, TextInput component, PasswordIcon property
     *               parameter, and separately set offIconSrc to obtain results
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1600', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: $r('app.media.icon'), offIconSrc: $r('app.media.icon')
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 obj Icon :' + JSON.stringify(Icon));
        expect((Icon.getElement('onIconSrc').asString().indexOf($r("app.media.icon").id.toString() + ".png")) != -1).assertTrue();
        expect((Icon.getElement('offIconSrc').asString().indexOf($r("app.media.icon").id.toString() + ".png")) != -1).assertTrue();

        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1600 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_PasswordIcon_1700
     * @tc.name Set Password Type Image Source
     * @tc.desc Set password type, image source verification, TextInput component, PasswordIcon property
     *               parameter, and separately set offIconSrc to obtain results
     */
    it('ArkUX_Stage_TextInput_PasswordIcon_static_1700', Level.LEVEL1, async (done: ()=>void) => {
      let passwordIcon: ESObject1 = {
        onIconSrc: "../../resources/base/media/icon.png", offIconSrc: "../../resources/base/media/icon.png"
      }
      await forKey("passWordIcon", "", passwordIcon);
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey('TextInput'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 obj $attrs.passwordIcon :' + JSON.stringify(obj.getElement('$attrs').getString('passwordIcon')));
        let Icon = JSON.parseJsonElement(obj.getElement('$attrs').getString('passwordIcon'));
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 obj Icon :' + JSON.stringify(Icon));
        expect(Icon.getElement('onIconSrc')).assertEqual("../../resources/base/media/icon.png");
        expect(Icon.getElement('offIconSrc')).assertEqual("../../resources/base/media/icon.png");
        done()
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Stage_TextInput_PasswordIcon_1700 err  :' + JSON.stringify(err))
        done()
      }
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0100
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to BarState.OFF
     */
    it('ArkUX_Stage_TextInput_barState_static_0100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0100 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.OFF');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0200
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to BarState.AUTO
     */
    it('ArkUX_Stage_TextInput_barState_static_0200', Level.LEVEL1, (done: ()=>void)  :void=> {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0200 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0300
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to BarState.ON
     */
    it('ArkUX_Stage_TextInput_barState_static_0300', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0300 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.ON');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0400
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to BarState.OFF,
     *               and then set the parameter to BarState.AUTO again
     */
    it('ArkUX_Stage_TextInput_barState_static_0400', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0400 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0500
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to 0
     */
    it('ArkUX_Stage_TextInput_barState_static_0500', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0500 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.OFF');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0600
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to 10
     */
    it('ArkUX_Stage_TextInput_barState_static_0600', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0600 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0700
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to "sfasf"
     */
    it('ArkUX_Stage_TextInput_barState_static_0700', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0700 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0800
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to ""
     */
    it('ArkUX_Stage_TextInput_barState_static_0800', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0800 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_0900
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to null
     */
    it('ArkUX_Stage_TextInput_barState_static_0900', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_0900 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_1000
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter of the TextInput component to undefined
     */
    it('ArkUX_Stage_TextInput_barState_static_1000', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1000 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_1100
     * @tc.name Set TextInput text status
     * @tc.desc Set the barState property parameter of the TextInput component to Outlier undefined,
     *               and set the parameter BarState.OFF again
     */
    it('ArkUX_Stage_TextInput_barState_static_1100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_1100');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1100 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_1200
     * @tc.name Set TextInput text status
     * @tc.desc Set the barState property parameter of the TextInput component to BarState.OFF,
     *               and set the parameter again to Outlier undefined
     */
    it('ArkUX_Stage_TextInput_barState_static_1200', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_barState_1200');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1200 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.ON');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_1300
     * @tc.name Set TextInput text status
     * @tc.desc Do not set the TextInput component barState property
     */
    it('ArkUX_Stage_TextInput_barState_static_1300', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('TextInputInlineNO');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1300 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.AUTO');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_barState_1400
     * @tc.name Set TextInput text status
     * @tc.desc Set the BarState property parameter to BarState.ON
     *               when the TextInput component is not in inline mode
     */
    it('ArkUX_Stage_TextInput_barState_static_1400', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('TextInputStyleDefault');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_barState_1400 barState:' + JSON.stringify(obj.getElement('$attrs').getString('barState')));
          expect(obj.getElement('$attrs').getString('barState')).assertEqual('BarState.ON');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_barState_1400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0100
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to 10
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0100');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0100 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('10');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0200
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to 0
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0200', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0200');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0200 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0300
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to "123"
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0300', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0300');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0300 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0300 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0400
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to -5
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0400', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0400');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0400 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0400 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0500
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to ""
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0500', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0500');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0500 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0500 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0600
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to null
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0600', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0600');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0600 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0600 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0700
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to undefined
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0700', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0700');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0700 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0700 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0800
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the MaxLines property parameter of the TextInput component to 1,
     *               and then set the parameter to 10 again
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0800', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0800');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0800 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('10');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0800 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_0900
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the maxLines attribute parameter of TextInput component to 10,
     *               and set the parameter to Outlier again
     */
    it('ArkUX_Stage_TextInput_maxLines_static_0900', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_0900');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_0900 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_0900 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_1000
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the maxLines property parameter of TextInput component to Outlier
     *               undefined, and set the parameter to 10 again
     */
    it('ArkUX_Stage_TextInput_maxLines_static_1000', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUX_Stage_TextInput_maxLines_1000');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_1000 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('10');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_1000 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_1100
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Do not set the TextInput component maxLines property
     */
    it('ArkUX_Stage_TextInput_maxLines_static_1100', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('TextInputInlineNO');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_1100 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('3');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_1100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /**
     * @tc.number ArkUX_Stage_TextInput_maxLines_1200
     * @tc.name Set the maximum number of lines in TextInput text
     * @tc.desc Set the TextInput component maxLines property in non inline mode
     */
    it('ArkUX_Stage_TextInput_maxLines_static_1200', Level.LEVEL1, (done: ()=>void) :void => {
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('TextInputStyleDefault');
          let obj = JSON.parseJsonElement(strJson);
          console.info('ArkUX_Stage_TextInput_maxLines_1200 maxLines:' + JSON.stringify(obj.getElement('$attrs').getString('maxLines')));
          expect(obj.getElement('$attrs').getString('maxLines')).assertEqual('1');
        } catch (err) {
          console.info('ArkUX_Stage_TextInput_maxLines_1200 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })
  })
}
