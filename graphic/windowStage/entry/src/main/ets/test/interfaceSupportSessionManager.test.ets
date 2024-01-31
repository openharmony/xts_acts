/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function interfaceSupportSessionManagerTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  describe('interface_support_sessionManager_test', () => {
    console.log('describe interface_support_sessionManager_test start!!!')

    let currentDeviceIsRk: boolean = false;
    beforeAll(async () => {
      // 获取当前的设备类型，区分是否是RK
      let deviceTypeInfo: string = deviceInfo.deviceType
      currentDeviceIsRk = deviceTypeInfo === 'default' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2510
     * @tc.name      : testKeepKeyboardOnFocus_SubWindow_True
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focusc.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SubWindow_True', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_SubWindow_True';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('testKeepKeyboardOnFocus_SubWindow')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      try {
        (subWindow as ohosWindow.Window).keepKeyboardOnFocus(true);
        await (subWindow as ohosWindow.Window).destroyWindow();
      } catch (exception) {
        await (subWindow as ohosWindow.Window).destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2520
     * @tc.name      : testKeepKeyboardOnFocus_SubWindow_False
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SubWindow_False', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_SubWindow_False';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow: ohosWindow.Window | void = await windowStage.createSubWindow('testKeepKeyboardOnFocus_SubWindow_False')
        .catch((err: BusinessError) => {
          expect().assertFail();
        });
      expect(!!subWindow).assertTrue();
      try {
        (subWindow as ohosWindow.Window).keepKeyboardOnFocus(false);
        await (subWindow as ohosWindow.Window).destroyWindow();
      } catch (exception) {
        await (subWindow as ohosWindow.Window).destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2530
     * @tc.name      : testKeepKeyboardOnFocus_SystemWindow_False
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SystemWindow_False', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_SystemWindow_False';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: 'testKeepKeyboardOnFocus_SystemWindow_False',
        windowType: ohosWindow.WindowType.TYPE_SYSTEM_ALERT,
        ctx: context
      };
      let tempWnd: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig)
        .catch((err: BusinessError) => {
          console.log(msgStr + 'createWindow tempWnd failed');
          expect().assertFail();
        });
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as ohosWindow.Window).keepKeyboardOnFocus(false);
        await (tempWnd as ohosWindow.Window).destroyWindow();
      } catch (exception) {
        await (tempWnd as ohosWindow.Window).destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2540
     * @tc.name      : testKeepKeyboardOnFocus_SystemWindow_True
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_SystemWindow_True', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_SystemWindow_True';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: 'testKeepKeyboardOnFocus_SystemWindow_True',
        windowType: ohosWindow.WindowType.TYPE_SYSTEM_ALERT,
        ctx: context
      };
      let tempWnd: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig)
        .catch((err: BusinessError) => {
          console.log(msgStr + 'createWindow tempWnd failed');
          expect().assertFail();
        });
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as ohosWindow.Window).keepKeyboardOnFocus(false);
        await (tempWnd as ohosWindow.Window).destroyWindow();
      } catch (exception) {
        await (tempWnd as ohosWindow.Window).destroyWindow();
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2550
     * @tc.name      : testKeepKeyboardOnFocus_WindowStateAbnormal
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_WindowStateAbnormal', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_SystemWindow_True';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: 'testKeepKeyboardOnFocus_SystemWindow_True',
        windowType: ohosWindow.WindowType.TYPE_SYSTEM_ALERT,
        ctx: context
      };
      let tempWnd: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig)
        .catch((err: BusinessError) => {
          console.log(msgStr + 'createWindow tempWnd failed');
          expect().assertFail();
        });
      expect(!!tempWnd).assertTrue();
      await (tempWnd as ohosWindow.Window).destroyWindow();
      try {
        (tempWnd as ohosWindow.Window).keepKeyboardOnFocus(false);
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2560
     * @tc.name      : testKeepKeyboardOnFocus_MainWindow
     * @tc.desc      : The soft keyboard created by other Windows is retained when the window is in focus
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testKeepKeyboardOnFocus_MainWindow', 0, async () => {
      let caseName: string = 'testKeepKeyboardOnFocus_MainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd: ohosWindow.Window | void = await windowStage.getMainWindow().catch((err: BusinessError) => {
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      try {
        (tempWnd as ohosWindow.Window).keepKeyboardOnFocus(true);
        expect().assertFail();
      } catch (exception) {
        console.error(msgStr + 'Failed to keep keyboard onFocus. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2570
     * @tc.name      : testWindowOffWindowVisibilityChange_UnregisteredOff
     * @tc.desc      : Enable this window to listen for status change events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowVisibilityChange_UnregisteredOff', 0, async () => {
      let caseName: string = 'testWindowOffWindowVisibilityChange_UnregisteredOff';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testWindowOffWindowVisibilityChange_UnregisteredOff",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      try {
        // @ts-ignore
        (win as ohosWindow.Window).off('windowVisibilityChange');
        await (win as ohosWindow.Window).destroyWindow();
        expect().assertFail();
      } catch (exception) {
        await (win as ohosWindow.Window).destroyWindow();
        console.error(msgStr + 'Failed to disable the listener for system avoid area changes. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2580
     * @tc.name      : testWindowOffWindowVisibilityChange_RepeatOff
     * @tc.desc      : Enable this window to listen for status change events
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testWindowOffWindowVisibilityChange_RepeatOff', 0, async () => {
      let caseName: string = 'testWindowOffWindowVisibilityChange_RepeatOff';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testWindowOffWindowVisibilityChange_RepeatOff",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      try {
        // @ts-ignore
        (win as ohosWindow.Window).on('windowVisibilityChange', (boolean) => {
          console.info(msgStr + 'Window visibility changed, isVisible=' + boolean);
        });
      } catch (exception) {
        if (!currentDeviceIsRk) {
          console.error('Failed to register callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        // @ts-ignore
        (win as ohosWindow.Window).off('windowVisibilityChange');
      } catch (exception) {
        if (!currentDeviceIsRk) {
          console.error(msgStr + 'Failed to unregister callback. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(1300002);
        }
      }
      try {
        (win as ohosWindow.Window).off('windowVisibilityChange');
        await (win as ohosWindow.Window).destroyWindow();
        expect().assertFail();
      } catch (exception) {
        await (win as ohosWindow.Window).destroyWindow();
        console.error(msgStr + 'Failed to unregister callback Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2590
     * @tc.name      : testSetSingleFrameComposerEnabled_True
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_True', 0, async () => {
      let caseName: string = 'testSetSingleFrameComposerEnabled_True';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetSingleFrameComposerEnabled_True",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      await (win as ohosWindow.Window).setSingleFrameComposerEnabled(true).then(async () => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        await (win as ohosWindow.Window).destroyWindow();
      }).catch((err: BusinessError) => {
        if (!currentDeviceIsRk) {
          console.error(msgStr + `ailed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2600
     * @tc.name      : testSetSingleFrameComposerEnabled_False
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_False', 0, async () => {
      let caseName: string = 'testSetSingleFrameComposerEnabled_False';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetSingleFrameComposerEnabled_False",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      await (win as ohosWindow.Window).setSingleFrameComposerEnabled(false).then(async () => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        await (win as ohosWindow.Window).destroyWindow();
      }).catch((err: BusinessError) => {
        if (!currentDeviceIsRk) {
          console.error(msgStr + `Failed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
          expect().assertFail();
        } else {
          console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          console.log(msgStr + JSON.stringify(err))
          expect(err.code).assertEqual(801);
        }
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2610
     * @tc.name      : testSetSingleFrameComposerEnabled_WindowStateAbnormal
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_WindowStateAbnormal', 0, async () => {
      let caseName: string = 'testSetSingleFrameComposerEnabled_WindowStateAbnormal';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetSingleFrameComposerEnabled_WindowStateAbnormal",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      await (win as ohosWindow.Window).destroyWindow();
      await (win as ohosWindow.Window).setSingleFrameComposerEnabled(false).then(() => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
        expect(err.code).assertEqual(1300002);
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2620
     * @tc.name      : testSetSingleFrameComposerEnabled_Invalid_ParameThree
     * @tc.desc      : Disable/Enable the function of single frame compositing render node
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSingleFrameComposerEnabled_Invalid_ParameThree', 0, async () => {
      let caseName: string = 'testSetSingleFrameComposerEnabled_Invalid_ParameThree';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: ohosWindow.Configuration = {
        name: "testSetSingleFrameComposerEnabled_Invalid_ParameThree",
        windowType: ohosWindow.WindowType.TYPE_FLOAT,
        ctx: context,
      };
      let win: ohosWindow.Window | void = await ohosWindow.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      // @ts-ignore
      await (win as ohosWindow.Window).setSingleFrameComposerEnabled(false,true).then(async () => {
        console.info(msgStr + 'Succeeded in enabling the single-frame-composer function.');
        await (win as ohosWindow.Window).destroyWindow();
        expect().assertFail();
      }).catch(async (err: BusinessError) => {
        console.error(msgStr + `Failed to enable the single-frame-composer function. code:${err.code}, message:${err.message}.`);
        await (win as ohosWindow.Window).destroyWindow();
        expect(err.code).assertEqual(401);
      });
    })

  })
}
