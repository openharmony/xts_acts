/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import window from '@ohos.window';
import { BusinessError, Callback } from '@ohos.base';

export default function windowLevelTest(context, windowStage,abilityStorage) {
  describe('window_level_test', function () {
    console.log('describe window_event_test start!!!')
    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      let result = await promise;
      clearTimeout(timeoutId)
    }
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5280
     * @tc.name      : testGetLastWindow_SubWindow_Promise
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_SubWindow_Promise', 0, async () => {
      let caseName = 'testGetLastWindow_SubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window | void = await windowStage.createSubWindow('testGetLastWindow_SubWindow_Promise')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).loadContent('MainAbility/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let lastWindow: window.Window | void = await window.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let properties = (lastWindow as window.Window).getWindowProperties();
      expect(properties.windowRect.width).assertEqual(401);
      expect(properties.windowRect.height).assertEqual(401);
      await (subWindow as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5290
     * @tc.name      : testGetLastWindow_SubWindow_Callback
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_SubWindow_Callback', 0, async (done) => {
      let caseName = 'testGetLastWindow_SubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window | void = await windowStage.createSubWindow('testGetLastWindow_SubWindow_Callback')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).loadContent('MainAbility/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      window.getLastWindow(context, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        let lastWindow = data;
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        expect(!!lastWindow).assertTrue();
        let properties = (lastWindow as window.Window).getWindowProperties();
        expect(properties.windowRect.width).assertEqual(401);
        expect(properties.windowRect.height).assertEqual(401);
        await (subWindow as window.Window).destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5300
     * @tc.name      : testGetLastWindow_TwoSubWindow_Promise
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_TwoSubWindow_Promise', 0, async () => {
      let caseName = 'testGetLastWindow_TwoSubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window | void = await windowStage.createSubWindow('testGetLastWindow_TwoSubWindow_Promise')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).loadContent('MainAbility/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let subWindowTwo: window.Window | void = await windowStage.createSubWindow('testGetLastWindow_SubWindowTwo')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindowTwo).assertTrue();
      await (subWindowTwo as window.Window).resize(501, 501).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindowTwo as window.Window).loadContent('MainAbility/pages/second/pageOne')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (subWindowTwo as window.Window).moveWindowTo(200, 200).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (subWindowTwo as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let lastWindow: window.Window | void = await window.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let properties = (lastWindow as window.Window).getWindowProperties();
      expect(properties.windowRect.width).assertEqual(501);
      expect(properties.windowRect.height).assertEqual(501);
      await (subWindow as window.Window).destroyWindow();
      await (subWindowTwo as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5310
     * @tc.name      : testGetLastWindow_TwoSubWindow_Callback
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_TwoSubWindow_Callback', 0, async (done) => {
      let caseName = 'testGetLastWindow_TwoSubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: window.Window | void = await windowStage.createSubWindow('testGetLastWindow_TwoSubWindow_Callback')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      expect(!!subWindow).assertTrue();
      await (subWindow as window.Window).resize(401, 401).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).loadContent('MainAbility/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (subWindow as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindow as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      let subWindowTwo: window.Window | void = await windowStage.createSubWindow('testGetLastWindow_TwoSubWindow_CallbackTwo')
        .catch((err: BusinessError) => {
          expect().assertFail();
          done();
        });
      expect(!!subWindowTwo).assertTrue();
      await (subWindowTwo as window.Window).resize(501, 501).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindowTwo as window.Window).loadContent('MainAbility/pages/second/pageOne')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (subWindowTwo as window.Window).moveWindowTo(200, 200).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (subWindowTwo as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      window.getLastWindow(context, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        let lastWindow = data;
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        expect(!!lastWindow).assertTrue();
        let properties = (lastWindow as window.Window).getWindowProperties();
        expect(properties.windowRect.width).assertEqual(501);
        expect(properties.windowRect.height).assertEqual(501);
        await (subWindow as window.Window).destroyWindow();
        await (subWindowTwo as window.Window).destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5320
     * @tc.name      : testGetLastWindow_DialogWindow_Promise
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_DialogWindow_Promise', 0, async () => {
      let caseName = 'testGetLastWindow_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId: string = 'testGetLastWindow_DialogWindow_Promise';
      let windowConfig: window.Configuration = {
        name: windowId, windowType: window.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd: window.Window | void;
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(402, 402).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as window.Window).loadContent('MainAbility/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      await (tempWnd as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await (tempWnd as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      let lastWindow: window.Window | void = await window.getLastWindow(context).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      })
      expect(!!lastWindow).assertTrue();
      console.log(msgStr + 'lastWindow is:' + JSON.stringify(lastWindow))
      let lastWindow_properties = (lastWindow as window.Window).getWindowProperties();
      let mainWin = windowStage.getMainWindowSync();
      let mainWin_properties = (mainWin as window.Window).getWindowProperties();
      expect(lastWindow_properties.windowRect.width).assertEqual(mainWin_properties.windowRect.width);
      expect(lastWindow_properties.windowRect.height).assertEqual(mainWin_properties.windowRect.height);
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5330
     * @tc.name      : testGetLastWindow_DialogWindow_Callback
     * @tc.desc      : Gets the last window displayed in the current app.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastWindow_DialogWindow_Callback', 0, async (done) => {
      let caseName = 'testGetLastWindow_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId: string = 'testGetLastWindow_DialogWindow_Callback';
      let windowConfig: window.Configuration = {
        name: windowId, windowType: window.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd: window.Window | void;
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as window.Window).resize(402, 402).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).loadContent('MainAbility/pages/second/second')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to loadContent the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      await (tempWnd as window.Window).moveWindowTo(100, 100).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await (tempWnd as window.Window).showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      window.getLastWindow(context, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the top window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        let lastWindow = data;
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        expect(!!lastWindow).assertTrue();
        let lastWindow_properties = (lastWindow as window.Window).getWindowProperties();
        let mainWin = windowStage.getMainWindowSync();
        let mainWin_properties = (mainWin as window.Window).getWindowProperties();
        expect(lastWindow_properties.windowRect.width).assertEqual(mainWin_properties.windowRect.width);
        expect(lastWindow_properties.windowRect.height).assertEqual(mainWin_properties.windowRect.height);
        await (tempWnd as window.Window).destroyWindow();
        done();
      });
    })
  })
}
