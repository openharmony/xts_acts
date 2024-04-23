/*
 * Copyright (c) 2022-2024 Huawei Device Co., Ltd.
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
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';

export default function windowVerificationProblemTest(context, windowStage, abilityStorage) {
  describe('window_verification_problem_test', function () {
    console.log('describe window_verification_problem_test start!!!')

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
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4040
     * @tc.name      : testSetWindowBrightness_NotAppWin_Callback
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_NotAppWin_Callback', 0, async function (done) {
      let caseName = 'testSetWindowBrightness_NotAppWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetWindowBrightness_NotAppWin_Callback",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      });
      expect(!!win).assertTrue();
      let brightness: number = -1.0;
      try {
        win.setWindowBrightness(brightness, async (err) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            await win.destroyWindow();
            expect(err.code).assertEqual(1300002);
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          expect().assertFail();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        await win.destroyWindow();
        expect(exception.code).assertEqual(1300002);
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4050
     * @tc.name      : testSetWindowBrightness_NotAppWin_Promise
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_NotAppWin_Promise', 0, async function () {
      let caseName = 'testSetWindowBrightness_NotAppWin_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetWindowBrightness_NotAppWin_Promise",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!win).assertTrue();
      let brightness: number = -1.0;
      try {
        await win.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
          expect().assertFail();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
      }
      await win.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4060
     * @tc.name      : testSetWindowBrightness_MainWin_DefaultValue_Promise
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_MainWin_DefaultValue_Promise', 0, async function () {
      let caseName = 'testSetWindowBrightness_MainWin_DefaultValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let brightness: number = -1.0;
      try {
        await mainWin.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4070
     * @tc.name      : testSetWindowBrightness_MainWin_DefaultValue_Callback
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_MainWin_DefaultValue_Callback', 0, async function (done) {
      let caseName = 'testSetWindowBrightness_NotAppWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      let brightness: number = -1.0;
      try {
        mainWin.setWindowBrightness(brightness, (err) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4080
     * @tc.name      : testSetWindowBrightness_SubWin_DefaultValue_Callback
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_SubWin_DefaultValue_Callback', 0, async function (done) {
      let caseName = 'testSetWindowBrightness_SubWin_DefaultValue_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin = null;
      subWin = await windowStage.createSubWindow('testSetWindowBrightness_SubWin_DefaultValue_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done()
        });
      expect(!!subWin).assertTrue();
      let brightness: number = -1.0;
      try {
        subWin.setWindowBrightness(brightness, async (err) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            done()
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          await subWin.destroyWindow();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done()
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4090
     * @tc.name      : testSetWindowBrightness_SubWin_DefaultValue_Promise
     * @tc.desc      : Set the screen brightness value
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetWindowBrightness_SubWin_DefaultValue_Promise', 0, async function () {
      let caseName = 'testSetWindowBrightness_SubWin_DefaultValue_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin = null;
      subWin = await windowStage.createSubWindow('testSetWindowBrightness_SubWin_DefaultValue_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      let brightness: number = -1.0;
      try {
        await subWin.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect().assertFail();
        });
        await subWin.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4100
     * @tc.name      : testResize_FullScreen_Promise
     * @tc.desc      : Verify the full screen window resize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_FullScreen_Promise', 0, async function () {
      let caseName = 'testResize_FullScreen_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testResize_FullScreen_Promise",
        windowType: ohosWindow.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let win = null;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'ohosWindow.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      console.log(msgStr + 'Succeeded in createWindow');
      expect(!!win).assertTrue();
      await (win as ohosWindow.Window).loadContent('MainAbility/pages/second/second')
        .catch((err: BusinessError) => {
          console.log(msgStr + 'tempWnd.loadContent failed');
          expect().assertFail();
        });
      await (win as ohosWindow.Window).moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.moveWindowTo failed');
        expect().assertFail();
      });
      await (win as ohosWindow.Window).showWindow().catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.showWindow failed');
        expect().assertFail();
      });
      await (win as ohosWindow.Window).resize(606, 606).catch((err: BusinessError) => {
        console.log(msgStr + 'tempWnd.resize failed');
        expect().assertFail();
      });
      await (win as ohosWindow.Window).setWindowLayoutFullScreen(true).then(() => {
        console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        expect().assertFail();
      });
      let names: Array<'status' | 'navigation'> = [];
      try {
        await (win as ohosWindow.Window).setWindowSystemBarEnable(names).then(() => {
          console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        expect().assertFail();
      }
      await (win as ohosWindow.Window).resize(707, 707).then(() => {
        console.info(msgStr + 'Succeeded in changing the window size.');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
      });
      await win.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4110
     * @tc.name      : testSetAspectRatio_Max_Value_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Max_Value_Promise', 0, async function () {
      let caseName = 'testSetAspectRatio_Max_Value_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MAX_VALUE;
        await mainWin.setAspectRatio(ratio).then(async () => {
          expect().assertFail();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4120
     * @tc.name      : testSetAspectRatio_Max_Value_Callback
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Max_Value_Callback', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Max_Value_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MAX_VALUE;
        mainWin.setAspectRatio(ratio, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the aspect ratio of window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4130
     * @tc.name      : testSetAspectRatio_Min_Value_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Min_Value_Promise', 0, async function () {
      let caseName = 'testSetAspectRatio_Min_Value_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MIN_VALUE;
        await mainWin.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4140
     * @tc.name      : testSetAspectRatio_Minus_Min_Value_Promise
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Minus_Min_Value_Promise', 0, async function () {
      let caseName = 'testSetAspectRatio_Minus_Min_Value_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = -Number.MIN_VALUE;
        await mainWin.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. err:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4150
     * @tc.name      : testSetAspectRatio_Min_Value_Callback
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Min_Value_Callback', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Min_Value_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = Number.MIN_VALUE;
        mainWin.setAspectRatio(ratio, (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
            expect(errCode).assertEqual(401);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the aspect ratio of window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4160
     * @tc.name      : testSetAspectRatio_Minus_Min_Value_Callback
     * @tc.desc      : Validate the scenario where the content layout proportion of the main window is abnormal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetAspectRatio_Minus_Min_Value_Callback', 0, async function (done) {
      let caseName = 'testSetAspectRatio_Minus_Min_Value_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      try {
        let ratio = -Number.MIN_VALUE;
        mainWin.setAspectRatio(ratio, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the aspect ratio of window.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. exception: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4170
     * @tc.name      : testDisplayOffAdd_RepeatOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffAdd_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffAdd_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<number> = (data: number) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on("add", callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("add");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("add");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4180
     * @tc.name      : testDisplayOffAdd_UnregisteredOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffAdd_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffAdd_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("add");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4190
     * @tc.name      : testDisplayOffRemove_RepeatOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffRemove_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffRemove_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<number> = (data: number) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on("remove", callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("remove");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("remove");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4200
     * @tc.name      : testDisplayOffRemove_UnregisteredOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffRemove_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffRemove_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("remove");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4210
     * @tc.name      : testDisplayOffChange_RepeatOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffChange_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<number> = (data: number) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on("change", callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("change");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("change");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4220
     * @tc.name      : testDisplayOffChange_UnregisteredOff
     * @tc.desc      : Turn off the monitor that shows device changes
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffChange_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("change");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4230
     * @tc.name      : testDisplayOffFoldStatusChange_RepeatOff
     * @tc.desc      : Enable the monitoring of the folding status change of the folding device
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldStatusChange_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffFoldStatusChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on('foldStatusChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4240
     * @tc.name      : testDisplayOffFoldStatusChange_UnregisteredOff
     * @tc.desc      : Enable the monitoring of the folding status change of the folding device
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldStatusChange_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffFoldStatusChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("foldStatusChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4250
     * @tc.name      : testDisplayOffFoldDisplayModeChange_RepeatOff
     * @tc.desc      : Turn off monitoring for screen display mode changes on folding devices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldDisplayModeChange_RepeatOff', 0, async function () {
      let caseName = 'testDisplayOffFoldDisplayModeChange_RepeatOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let callback: Callback<display.FoldDisplayMode> = (data: display.FoldDisplayMode) => {
        console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
      };
      try {
        display.on('foldDisplayModeChange', callback);
      } catch (exception) {
        console.error(msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldDisplayModeChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
      try {
        display.off("foldDisplayModeChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4260
     * @tc.name      : testDisplayOffFoldDisplayModeChange_UnregisteredOff
     * @tc.desc      : Turn off monitoring for screen display mode changes on folding devices
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDisplayOffFoldDisplayModeChange_UnregisteredOff', 0, async function () {
      let caseName = 'testDisplayOffFoldDisplayModeChange_UnregisteredOff';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin')
      try {
        display.off("foldDisplayModeChange");
      } catch (exception) {
        console.error(msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4270
     * @tc.name      : testResize_Dialog_SetLessThenWindowLimits
     * @tc.desc      : Verify that get and set values are the same
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testResize_Dialog_SetLessThenWindowLimits', 0, async function () {
      let caseName = 'testResize_Dialog_SetLessThenWindowLimits';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testResize_Dialog_SetLessThenWindowLimits';
      let windowConfig = {
        name: windowId, windowType: ohosWindow.WindowType.TYPE_DIALOG, ctx: context
      };
      let tempWnd = null;
      let windowLimits = null;
      tempWnd = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'createWindow tempWnd failed');
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.loadContent('MainAbility/pages/second/second').catch((err) => {
        console.log(msgStr + 'tempWnd.loadContent failed');
        expect().assertFail();
      });
      await tempWnd.moveWindowTo(0, 0).catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await tempWnd.showWindow().catch((err: BusinessError) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await tempWnd.resize(10, 10).then(() => {
        console.log(msgStr + 'tempWnd.resize successed');
      }).catch((err) => {
        console.log(msgStr + 'tempWnd.resize failed Cause: ' + JSON.stringify(err));
        expect().assertFail();
      });
      await sleep(1000)
      let properties = tempWnd.getWindowProperties();
      console.log(msgStr + " getWindowProperties is: " + JSON.stringify(properties))
      expect(properties.windowRect.width !== 10).assertEqual(true)
      expect(properties.windowRect.height !== 10).assertEqual(true)
      await tempWnd.destroyWindow();
    })
  })
}
