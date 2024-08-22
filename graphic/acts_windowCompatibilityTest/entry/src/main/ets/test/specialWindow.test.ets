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

export default function specialWindowTest(context, windowStage, abilityStorage) {
  describe('special_window_test', function () {
    console.log('describe special_window_test start!!!')

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4620
     * @tc.name      : testCreateWindow_DialogWindow_Callback
     * @tc.desc      : Create a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateWindow_DialogWindow_Callback', 0, async (done) => {
      let caseName = 'testCreateWindow_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      let config: window.Configuration = {
        name: "testCreateWindow_DialogWindow_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      try {
        window.createWindow(config, async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the window. Data: ' + JSON.stringify(data));
          windowClass.resize(500, 1000);
          await windowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4630
     * @tc.name      : testCreateWindow_DialogWindow_Promise
     * @tc.desc      : Create a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateWindow_DialogWindow_Promise', 0, async (done) => {
      let caseName = 'testCreateWindow_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      let config: window.Configuration = {
        name: "testCreateWindow_DialogWindow_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      try {
        await window.createWindow(config).then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          await windowClass.destroyWindow();
          done();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the Window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4640
     * @tc.name      : testCreate_DialogWindow_Callback
     * @tc.desc      : Create a system window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreate_DialogWindow_Callback', 0, async (done) => {
      let caseName = 'testCreate_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      window.create(context, 'testCreate_DialogWindow_Callback', window.WindowType.TYPE_DIALOG, async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to create the window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
          return;
        }
        windowClass = data;
        console.info(msgStr + 'Succeeded in creating the window. Data: ' + JSON.stringify(data));
        windowClass.resetSize(500, 1000);
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4650
     * @tc.name      : testCreate_DialogWindow_Promise
     * @tc.desc      : Create a system window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreate_DialogWindow_Promise', 0, async (done) => {
      let caseName = 'testCreate_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      await window.create(context, 'testCreate_DialogWindow_Promise', window.WindowType.TYPE_DIALOG)
        .then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          await windowClass.destroyWindow();
          done();
        })
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the Window. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4670
     * @tc.name      : testGetSubWindow_SubWinNumIsOne_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsOne_Promise', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinNumIsOne_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin;
      subWin = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsOne_Promise')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWin).assertTrue();
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(1);
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      await subWin.destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4680
     * @tc.name      : testGetSubWindow_SubWinNumIsMore_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsMore_Promise', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinNumIsMore_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWinFirst;
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Promise_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let subWinSecond;
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Promise_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      let subWinThird;
      subWinThird = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Promise_Third')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinThird).assertTrue();
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(3);
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      await subWinFirst.destroyWindow();
      await subWinSecond.destroyWindow();
      await subWinThird.destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4690
     * @tc.name      : testGetSubWindow_SubWinAndHasDialogWin_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndHasDialogWin_Promise', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinAndHasDialogWin_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWinFirst;
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Promise_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let subWinSecond;
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Promise_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      let windowConfig = {
        name: "testGetSubWindow_SubWinAndHasDialogWin_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd;
      tempWnd = await window.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(2);
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
      });
      await subWinFirst.destroyWindow();
      await subWinSecond.destroyWindow();
      await tempWnd.destroyWindow();
      done();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4700
     * @tc.name      : testGetSubWindow_SubWinNumIsOne_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsOne_Callback', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinNumIsOne_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin;
      subWin = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsOne_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWin).assertTrue();
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWin.destroyWindow();
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(1);
        await subWin.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4710
     * @tc.name      : testGetSubWindow_SubWinNumIsMore_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinNumIsMore_Callback', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinNumIsMore_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWinFirst;
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Callback_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let subWinSecond;
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Callback_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      let subWinThird;
      subWinThird = await windowStage.createSubWindow('testGetSubWindow_SubWinNumIsMore_Callback_Third')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinThird).assertTrue();
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWinFirst.destroyWindow();
          await subWinSecond.destroyWindow();
          await subWinThird.destroyWindow();
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(3);
        await subWinFirst.destroyWindow();
        await subWinSecond.destroyWindow();
        await subWinThird.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4720
     * @tc.name      : testGetSubWindow_SubWinAndHasDialogWin_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndHasDialogWin_Callback', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinAndHasDialogWin_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWinFirst;
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Callback_First')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let subWinSecond;
      subWinSecond = await windowStage.createSubWindow('testGetSubWindow_SubWinAndHasDialogWin_Callback_Second')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinSecond).assertTrue();
      let windowConfig = {
        name: "testGetSubWindow_SubWinAndHasDialogWin_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd;
      tempWnd = await window.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWinFirst.destroyWindow();
          await subWinSecond.destroyWindow();
          await tempWnd.destroyWindow();
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        expect(windowArrayLength).assertEqual(2);
        await subWinFirst.destroyWindow();
        await subWinSecond.destroyWindow();
        await tempWnd.destroyWindow();
        done();
      });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4730
     * @tc.name      : testCreateSubWindow_Callback
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_Callback', 0, async (done) => {
      let caseName = 'testCreateSubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      try {
        windowStage.createSubWindow('testCreateSubWindow_Callback', async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4740
     * @tc.name      : testCreateSubWindow_Promise
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_Promise', 0, async () => {
      let caseName = 'testCreateSubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      try {
        await windowStage.createSubWindow('testCreateSubWindow_Promise').then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4750
     * @tc.name      : testCreateSubWindow_WinNameNull_Promise
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameNull_Promise', 0, async () => {
      let caseName = 'testCreateSubWindow_WinNameNull_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      try {
        await windowStage.createSubWindow(null).then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4760
     * @tc.name      : testCreateSubWindow_WinNameNull_Callback
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameNull_Callback', 0, async (done) => {
      let caseName = 'testCreateSubWindow_WinNameNull_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      try {
        windowStage.createSubWindow(null, async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4770
     * @tc.name      : testCreateSubWindow_WinNameUndefined_Promise
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameUndefined_Promise', 0, async () => {
      let caseName = 'testCreateSubWindow_WinNameUndefined_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      try {
        await windowStage.createSubWindow(undefined).then(async (data) => {
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4780
     * @tc.name      : testCreateSubWindow_WinNameUndefined_Callback
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindow_WinNameUndefined_Callback', 0, async (done) => {
      let caseName = 'testCreateSubWindow_WinNameUndefined_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass: window.Window | undefined = undefined;
      try {
        windowStage.createSubWindow(undefined, async (err: BusinessError, data) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
            done();
            return;
          }
          windowClass = data;
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await windowClass.destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4790
     * @tc.name      : testSetSubWindowModal_DialogWindow
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_DialogWindow', 0, async () => {
      let caseName = 'testSetSubWindowModal_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig = {
        name: "testSetSubWindowModal_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd;
      tempWnd = await window.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      await tempWnd.setSubWindowModal(true).then(() => {
        console.info(msgStr + 'Succeeded in setting subwindow modal');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300004);
      });
      await tempWnd.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4800
     * @tc.name      : testSetSubWindowModal_MainWindow
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_MainWindow', 0, async () => {
      let caseName = 'testSetSubWindowModal_MainWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      await mainWin.setSubWindowModal(true).then(() => {
        console.info(msgStr + 'Succeeded in setting subwindow modal');
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(1300004);
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4810
     * @tc.name      : testSetSubWindowModal_SubWindow
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_SubWindow', 0, async () => {
      let caseName = 'testSetSubWindowModal_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWin;
      subWin = await windowStage.createSubWindow('testSetSubWindowModal_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      try {
        await subWin.setSubWindowModal(false).then(() => {
          console.info(msgStr + 'Succeeded in setting subwindow modal');
        }).catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subWindow. out Cause code: ${exception.code}, message: ${exception.message}`);
      }
      await subWin.destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5400
     * @tc.name      : testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWinFirst;
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_subWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let windowConfig = {
        name: "testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd;
      tempWnd = await window.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let subWinWithOPsCreateSuccessed = false;
      let subWinWithOPs;
      let options: window.SubWindowOptions = {
        title: 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback_Sub',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Callback_Sub', options)
        .then(async (data) => {
          subWinWithOPs = data;
          expect(!!subWinWithOPs).assertTrue();
          subWinWithOPsCreateSuccessed = true;
        })
        .catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      let windowArray: window.Window[] = [];
      windowStage.getSubWindow(async (err: BusinessError, data) => {
        const errCode: number = err.code;
        if (errCode) {
          console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          await subWinFirst.destroyWindow();
          await tempWnd.destroyWindow();
          if (subWinWithOPsCreateSuccessed) {
            await subWinWithOPs.destroyWindow();
          }
          expect().assertFail();
          done();
          return;
        }
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        if (subWinWithOPsCreateSuccessed) {
          expect(windowArrayLength).assertEqual(2);
          await subWinWithOPs.destroyWindow();
        } else {
          expect(windowArrayLength).assertEqual(1);
        }
        await subWinFirst.destroyWindow();
        await tempWnd.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5410
     * @tc.name      : testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise
     * @tc.desc      : Gets all the child Windows under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise', 0, async (done) => {
      let caseName = 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWinFirst;
      subWinFirst = await windowStage.createSubWindow('testGetSubWindow_subWindow_Promise')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWinFirst).assertTrue();
      let windowConfig = {
        name: "testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      let tempWnd;
      tempWnd = await window.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let subWinWithOPsCreateSuccessed = false;
      let subWinWithOPs;
      let options: window.SubWindowOptions = {
        title: 'testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise_Sub',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testGetSubWindow_SubWinAndDialogWinAndSubWinWithOps_Promise_Sub', options)
        .then(async (data) => {
          subWinWithOPs = data;
          expect(!!subWinWithOPs).assertTrue();
          subWinWithOPsCreateSuccessed = true;
        })
        .catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
      let windowArray: window.Window[] = [];
      await windowStage.getSubWindow().then(async (data) => {
        windowArray = data;
        console.info(msgStr + 'Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
        let windowArrayLength = windowArray.length;
        if (subWinWithOPsCreateSuccessed) {
          expect(windowArrayLength).assertEqual(2);
          await subWinWithOPs.destroyWindow();
        } else {
          expect(windowArrayLength).assertEqual(1);
        }
        await subWinFirst.destroyWindow();
        await tempWnd.destroyWindow();
        done();
      }).catch(async (err: BusinessError) => {
        console.error(msgStr + `Failed to obtain the subwindow. Cause code: ${err.code}, message: ${err.message}`);
        await subWinFirst.destroyWindow();
        await tempWnd.destroyWindow();
        if (subWinWithOPsCreateSuccessed) {
          await subWinWithOPs.destroyWindow();
        }
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5420
     * @tc.name      : testCreateSubWindowWithOptions_Normal
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindowWithOptions_Normal', 0, async () => {
      let caseName = 'testCreateSubWindowWithOptions_Normal';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testCreateSubWindowWithOptions_Normal',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_Normal', options)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await data.destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5430
     * @tc.name      : testCreateSubWindowWithOptions_isModalIsUndefined
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindowWithOptions_isModalIsUndefined', 0, async () => {
      let caseName = 'testCreateSubWindowWithOptions_isModalIsUndefined';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testCreateSubWindowWithOptions_isModalIsUndefined',
        decorEnabled: true,
        isModal: undefined
      };
      await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_isModalIsUndefined', options)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await data.destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5440
     * @tc.name      : testCreateSubWindowWithOptions_isModalIsNull
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindowWithOptions_isModalIsNull', 0, async () => {
      let caseName = 'testCreateSubWindowWithOptions_isModalIsNull';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testCreateSubWindowWithOptions_isModalIsNull',
        decorEnabled: false,
        isModal: null
      };
      await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_isModalIsNull', options)
        .then(async (data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          await data.destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5450
     * @tc.name      : testCreateSubWindowWithOptions_TitleIsNotStr
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindowWithOptions_TitleIsNotStr', 0, async () => {
      let caseName = 'testCreateSubWindowWithOptions_TitleIsNotStr';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let options: window.SubWindowOptions = {
          title: false,
          decorEnabled: false,
        };
        await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_TitleIsNotStr', options)
          .then(async (data) => {
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            await data.destroyWindow();
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5460
     * @tc.name      : testCreateSubWindowWithOptions_decorEnabledIsNotBoolen
     * @tc.desc      : Create a child window under the WindowStage instance
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSubWindowWithOptions_decorEnabledIsNotBoolen', 0, async () => {
      let caseName = 'testCreateSubWindowWithOptions_decorEnabledIsNotBoolen';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let options: window.SubWindowOptions = {
          title: 'testCreateSubWindowWithOptions_decorEnabledIsNotBoolen',
          decorEnabled: 'false',
        };
        await windowStage.createSubWindowWithOptions('testCreateSubWindowWithOptions_decorEnabledIsNotBoolen', options)
          .then(async (data) => {
            console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
            await data.destroyWindow();
          })
          .catch((err: BusinessError) => {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(401);
          });
      } catch (exception) {
        console.error(msgStr + `Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
        expect(exception.code).assertEqual(401);
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5470
     * @tc.name      : testSetSubWindowModal_SubWindowWithOps
     * @tc.desc      : Sets whether the modal properties of the subwindow are enabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSetSubWindowModal_SubWindowWithOps', 0, async () => {
      let caseName = 'testSetSubWindowModal_SubWindowWithOps';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'testSetSubWindowModal_SubWindowWithOps',
        decorEnabled: true
      };
      let subWin;
      await windowStage.createSubWindowWithOptions('testSetSubWindowModal_SubWindowWithOps', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          try {
            await subWin.setSubWindowModal(false).then(() => {
              console.info(msgStr + 'Succeeded in setting subwindow modal');
            }).catch((err: BusinessError) => {
              if (err.code != 801) {
                console.error(msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
              } else {
                console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                console.log(msgStr + JSON.stringify(err))
                expect(err.code).assertEqual(801);
              }
            });
          } catch (exception) {
            console.error(msgStr + `Failed to create the subWindow. out Cause code: ${exception.code}, message: ${exception.message}`);
          }
          await subWin.destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 801) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(801);
          }
        });
    })
  })
}
