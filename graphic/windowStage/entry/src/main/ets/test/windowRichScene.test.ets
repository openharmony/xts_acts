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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import screen from '@ohos.screen';
import display from '@ohos.display';
import screenshot from '@ohos.screenshot';
import { UiDriver, BY, ON, PointerMatrix } from '@ohos.UiTest'

export default function windowPromiseTest(context, windowStage, abilityStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('window_richScene_test', function () {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;

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
     * @tc.number SUB_WINDOW_CREATEWINDOWTEST_JSAPI_001
     * @tc.name Test createWindow_Test_001
     * @tc.desc Verify The optional parameter is error
     */
    it('createWindow_Test_001', 0, async function (done) {
      let caseName = 'createWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindow_Test_001'
      let windowConfig = {
        name: windowId, windowType: 18, ctx: context
      };
      let win;
      try {
        win = await ohosWindow.createWindow(windowConfig).then((data) => {
          console.log(msgStr + 'Window createWindow data: ' + JSON.stringify(data));
          done();
        })
      } catch (err) {
        console.log(msgStr + 'Window createWindow catch err: ' + JSON.stringify(err))
        expect(err.code).assertEqual(401)
        done()
      }
    })
    /**
     * @tc.number SUB_WINDOW_CREATEWINDOWTEST_JSAPI_002
     * @tc.name Test createWindow_Test_002
     * @tc.desc Verify The optional parameter is error
     */
    it('createWindow_Test_002', 0, async function (done) {
      let caseName = 'createWindow_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'createWindow_Test_002'
      let windowConfig = {
        name: windowId, windowType: 18, ctx: context
      };
      let win;
      try {
        win = await ohosWindow.createWindow(windowConfig, (err, data) => {
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
        });
      } catch (err) {
        console.log(msgStr + 'Window createWindow catch err: ' + JSON.stringify(err))
        expect(err.code).assertEqual(401)
        done()
      }
    })
    /**
     * @tc.number SUB_WINDOW_FINEDWINDOW_JSAPI_001
     * @tc.name Test findWindow_Test_001
     * @tc.desc Find the window corresponding to name
     */
    it('findWindow_Test_001', 0, async function (done) {
      let caseName = 'findWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'findWindow_Test_001'
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let win;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!win).assertTrue();
      try {
        let windowClass = ohosWindow.findWindow('findWindow_Test_001');
        console.log(msgStr + 'findWindow windowClass: ' + JSON.stringify(windowClass))
        expect(!!windowClass).assertTrue();
        await win.destroyWindow()
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_FINEDWINDOW_JSAPI_002
     * @tc.name Test findWindow_Test_002
     * @tc.desc Verify The optional parameter is error
     */
    it('findWindow_Test_002', 0, async function (done) {
      let caseName = 'findWindow_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowClass;
        windowClass = ohosWindow.findWindow('findWindow_Test_002');
        expect(!windowClass).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_CREATE_JSAPI_001
     * @tc.name Test create_Test_001
     * @tc.desc Verify The optional parameter is error
     */
    it('create_Test_001', 0, async function (done) {
      let caseName = 'create_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      ohosWindow.create(context, 'create_Test_001', 20).catch((err) => {
        console.error(msgStr + 'Failed to create the subWindow. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1003);
        done();
      });

    })
    /**
     * @tc.number SUB_WINDOW_CREATE_JSAPI_002
     * @tc.name Test create_Test_002
     * @tc.desc Verify The optional parameter is error
     */
    it('create_Test_002', 0, async function (done) {
      let caseName = 'create_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      ohosWindow.create(context, 'create_Test_002', 20, (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to create the subWindow. Cause: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(1003);
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in creating the subWindow. Data: ' + JSON.stringify(data));
        try {
          expect().assertFail();
        } catch (error) {
          console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
        }
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_FINED_JSAPI_001
     * @tc.name Test find_Test_001
     * @tc.desc Find the window corresponding to name
     */
    it('find_Test_001', 0, async function (done) {
      let caseName = 'find_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'find_Test_001'
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let win;
      win = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!win).assertTrue();
      try {
        let windowClass;
        windowClass = await ohosWindow.find('find_Test_001').catch((err) => {
          console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        expect(!!windowClass).assertTrue();
        let windowClass2;
        windowClass2 = await ohosWindow.find('find_Test_001').catch((err) => {
          console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        expect(!!windowClass2).assertTrue();
        await win.destroyWindow()
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_FINED_JSAPI_002
     * @tc.name Test find_Test_002
     * @tc.desc Verify The optional parameter is error
     */
    it('find_Test_002', 0, async function (done) {
      let caseName = 'find_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      ohosWindow.find('find_Test_002', (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to find the Window. Cause: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(1001);
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        windowClass = data;
        console.info(msgStr + 'Succeeded in finding the window. Data: ' + JSON.stringify(data));
        try {
          expect().assertFail();
        } catch (error) {
          console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
        }
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETTOPWINDOW_JSAPI_001
     * @tc.name Test getTopWindow_Test_001
     * @tc.desc Gets the last window displayed in the current app
     */
    it('getTopWindow_Test_001', 0, async function (done) {
      let caseName = 'getTopWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      ohosWindow.getTopWindow(context, (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
        ohosWindow.getTopWindow(context, (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
          done();
        });
      });
    })
    /**
     * @tc.number SUB_WINDOW_SHOWWINDOW_JSAPI_001
     * @tc.name Test showWindow_Test_001
     * @tc.desc Verify The optional parameter is error
     */
    it('showWindow_Test_001', 0, async function (done) {
      let caseName = 'showWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      windowClass = await ohosWindow.getLastWindow(context).catch((err) => {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      windowClass.showWindow((err) => {
        if (err.code) {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in showing the window.');
        windowClass.showWindow().then(() => {
          console.info(msgStr + 'Succeeded in showing the window.');
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      });
    })
    /**
     * @tc.number SUB_WINDOW_SHOWWINDOW_JSAPI_002
     * @tc.name Test showWindow_Test_002
     * @tc.desc Verify The optional parameter is error
     */
    it('showWindow_Test_002', 0, async function (done) {
      let caseName = 'showWindow_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "showWindow_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      windowClass.showWindow().then(() => {
        console.info(msgStr + 'Succeeded in showing the window.');
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1300002);
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_DESTROYWINOW_JSAPI_001
     * @tc.name Test destroyWindow_Test_001
     * @tc.desc Verify The optional parameter is error
     */
    it('destroyWindow_Test_001', 0, async function (done) {
      let caseName = 'destroyWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "destroyWindow_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      windowClass.destroyWindow((err) => {
        if (err.code) {
          console.error(msgStr + 'Failed to destroy the window. Cause:' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(1300002);
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in destroying the window.');
        expect().assertFail();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWPROPERTIES_JSAPI_001
     * @tc.name Test getWindowProperties_Test_001
     * @tc.desc Gets the properties of the current window Continuous call interface
     */
    it('getWindowProperties_Test_001', 0, async function (done) {
      let caseName = 'getWindowProperties_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getWindowProperties_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let properties = windowClass.getWindowProperties();
        expect(!!properties).assertTrue();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        let properties2 = windowClass.getWindowProperties();
        expect(!!properties2).assertTrue();
        await windowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWAVOIDAREA_JSAPI_001
     * @tc.name Test getWindowAvoidArea_Test_001
     * @tc.desc Verify The optional parameter is error
     */
    it('getWindowAvoidArea_Test_001', 0, async function (done) {
      let caseName = 'getWindowAvoidArea_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getWindowAvoidArea_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let type = ohosWindow.AvoidAreaType.TYPE_SYSTEM;
      try {
        let avoidArea = windowClass.getWindowAvoidArea(type);
        expect(!!avoidArea).assertTrue();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      let type2 = ohosWindow.AvoidAreaType.TYPE_CUTOUT;
      try {
        let avoidArea = windowClass.getWindowAvoidArea(type2);
        expect(!!avoidArea).assertTrue();
        await windowClass.destroyWindow();
        done()
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWAVOIDAREA_JSAPI_002
     * @tc.name Test getWindowAvoidArea_Test_002
     * @tc.desc Verify The optional parameter is error
     */
    it('getWindowAvoidArea_Test_002', 0, async function (done) {
      let caseName = 'getWindowAvoidArea_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getWindowAvoidArea_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let avoidArea = windowClass.getWindowAvoidArea(4);
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        await windowClass.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWLAYOUTFULLSCREEN_JSAPI_001
     * @tc.name Test setWindowLayoutFullScreen_Test_001
     * @tc.desc Sets whether the layout of the window is immersive
     */
    it('setWindowLayoutFullScreen_Test_001', 0, async function (done) {
      let caseName = 'setWindowLayoutFullScreen_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowLayoutFullScreen_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let isLayoutFullScreen = true;
      try {
        await windowClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowLayoutFullScreen(false, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
          await windowClass.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWLAYOUTFULLSCREEN_JSAPI_002
     * @tc.name Test setWindowLayoutFullScreen_Test_002
     * @tc.desc Sets whether the layout of the window is immersive
     */
    it('setWindowLayoutFullScreen_Test_002', 0, async function (done) {
      let caseName = 'setWindowLayoutFullScreen_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowLayoutFullScreen_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let isLayoutFullScreen = true;
      try {
        await windowClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowLayoutFullScreen(false, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(1300002);
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window layout to full-screen mode.');
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window layout to full-screen mode. catch Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWCOLORAPACE_JSAPI_001
     * @tc.name Test setWindowColorSpace_Test_001
     * @tc.desc Set the current window to wide gamut mode or default gamut mode
     */
    it('setWindowColorSpace_Test_001', 0, async function (done) {
      let caseName = 'setWindowColorSpace_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      try {
        windowClass.setWindowColorSpace(2).then(() => {
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace.catch Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWCOLORAPACE_JSAPI_002
     * @tc.name Test setWindowColorSpace_Test_002
     * @tc.desc Set the current window to wide gamut mode or default gamut mode
     */
    it('setWindowColorSpace_Test_002', 0, async function (done) {
      let caseName = 'setWindowColorSpace_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      try {
        windowClass.setWindowColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting window colorspace.');
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        let promise = windowClass.setWindowColorSpace(ohosWindow.ColorSpace.DEFAULT);
        promise.then(() => {
          console.info(msgStr + 'Succeeded in setting window colorspace.');
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set window colorspace. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set window colorspace. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_GETWINDOWCOLORAPACE_JSAPI_001
     * @tc.name Test getWindowColorSpace_Test_001
     * @tc.desc Gets the current window gamut mode
     */
    it('getWindowColorSpace_Test_001', 0, async function (done) {
      let caseName = 'getWindowColorSpace_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let colorSpace = windowClass.getWindowColorSpace();
      let res1 = colorSpace == 0 || colorSpace == 1
      expect(res1).assertEqual(true);
      let colorSpace2 = windowClass.getWindowColorSpace();
      let res2 = colorSpace2 == 0 || colorSpace == 1
      expect(res2).assertEqual(true);
      done();
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWBACKGROUNDCOLOR_JSAPI_001
     * @tc.name Test setWindowBackgroundColor_Test_001
     * @tc.desc Set the background color of the window
     */
    it('setWindowBackgroundColor_Test_001', 0, async function (done) {
      let caseName = 'setWindowBackgroundColor_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let color = '#00ff33';
      try {
        windowClass.setWindowBackgroundColor(color);
      } catch (exception) {
        console.error(msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      let color2 = '#FFFFFF';
      try {
        windowClass.setWindowBackgroundColor(color2);
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWBACKGROUNDCOLOR_JSAPI_002
     * @tc.name Test setWindowBackgroundColor_Test_002
     * @tc.desc Set the background color of the window
     */
    it('setWindowBackgroundColor_Test_002', 0, async function (done) {
      let caseName = 'setWindowBackgroundColor_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let color = '#00f';
      try {
        windowClass.setWindowBackgroundColor(color);
      } catch (exception) {
        console.error(msgStr + 'Failed to set the background color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWBRIGHTNESS_JSAPI_001
     * @tc.name Test setWindowBrightness_Test_001
     * @tc.desc Set the screen brightness value
     */
    it('setWindowBrightness_Test_001', 0, async function (done) {
      let caseName = 'setWindowBrightness_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let brightness = 2;
      try {
        windowClass.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. catch Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWBRIGHTNESS_JSAPI_002
     * @tc.name Test setWindowBrightness_Test_002
     * @tc.desc Set the screen brightness value
     */
    it('setWindowBrightness_Test_002', 0, async function (done) {
      let caseName = 'setWindowBrightness_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      let brightness = 1;
      try {
        windowClass.setWindowBrightness(brightness).then(() => {
          console.info(msgStr + 'Succeeded in setting the brightness.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. catch Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      let brightness2 = 0.5;
      try {
        windowClass.setWindowBrightness(brightness2, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the brightness.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the brightness. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWFOCUSABLE_JSAPI_001
     * @tc.name Test setWindowFocusable_Test_001
     * @tc.desc Set whether to switch focus window when clicking
     */
    it('setWindowFocusable_Test_001', 0, async function (done) {
      let caseName = 'setWindowFocusable_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      try {
        let promise = windowClass.setWindowFocusable(false);
        promise.then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to be focusable. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowFocusable(true, (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be focusable.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be focusable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWKEEPSCREENON_JSAPI_001
     * @tc.name Test setWindowKeepScreenOn_Test_001
     * @tc.desc Set whether the screen is steady on
     */
    it('setWindowKeepScreenOn_Test_001', 0, async function (done) {
      let caseName = 'setWindowKeepScreenOn_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowKeepScreenOn_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowKeepScreenOn(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.info(msgStr + 'Failed to set the screen to be always on. Cause:  ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. catch Cause: ' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWKEEPSCREENON_JSAPI_002
     * @tc.name Test setWindowKeepScreenOn_Test_002
     * @tc.desc Set whether the screen is steady on
     */
    it('setWindowKeepScreenOn_Test_002', 0, async function (done) {
      let caseName = 'setWindowKeepScreenOn_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowKeepScreenOn_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.setWindowKeepScreenOn(false).then(() => {
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
        }).catch((err) => {
          console.info(msgStr + 'Failed to set the screen to be always on. Cause:  ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowKeepScreenOn(true, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            await windowClass.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the screen to be always on.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the screen to be always on. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWPRIVACYMODE_TEST_JSAPI_001
     * @tc.name Test setWindowPrivacyMode_Test_001
     * @tc.desc Sets whether the window is in private mode
     */
    it('setWindowPrivacyMode_Test_001', 0, async function (done) {
      let caseName = 'setWindowPrivacyMode_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowPrivacyMode_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowPrivacyMode(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.info(msgStr + 'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. catch Cause: ' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWPRIVACYMODE_TEST_JSAPI_002
     * @tc.name Test setWindowPrivacyMode_Test_002
     * @tc.desc Sets whether the window is in private mode
     */
    it('setWindowPrivacyMode_Test_002', 0, async function (done) {
      let caseName = 'setWindowPrivacyMode_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowPrivacyMode_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.setWindowPrivacyMode(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to privacy mode. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
      }
      try {
        windowClass.setWindowPrivacyMode(false, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            await windowClass.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to privacy mode.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWTOUCHABLE_JSAPI_001
     * @tc.name Test setWindowTouchable_Test_001
     * @tc.desc Sets whether the window is touchable
     */
    it('setWindowTouchable_Test_001', 0, async function (done) {
      let caseName = 'setWindowTouchable_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowTouchable_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.setWindowTouchable(false).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to be touchable. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        windowClass.setWindowTouchable(true, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            await windowClass.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWTOUCHABLE_JSAPI_002
     * @tc.name Test setWindowTouchable_Test_002
     * @tc.desc Sets whether the window is touchable
     */
    it('setWindowTouchable_Test_002', 0, async function (done) {
      let caseName = 'setWindowTouchable_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowTouchable_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        await windowClass.setWindowTouchable(true).then(() => {
          console.info(msgStr + 'Succeeded in setting the window to be touchable.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the window to be touchable. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the window to be touchable. Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETASPECTRATIO_TEST_JSAPI_001
     * @tc.name Test setAspectRatio_Test_001
     * @tc.desc Set the proportion of the window content layout
     */
    it('setAspectRatio_Test_001', 0, async function (done) {
      let caseName = 'setAspectRatio_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setAspectRatio_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let ratio = 1.0;
        await windowClass.setAspectRatio(ratio).then(() => {
          console.info(msgStr + 'Succeeded in setting aspect ratio of window.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to set the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the aspect ratio of window. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
        await windowClass.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_RESETASPECTRATIO_JSAPI_001
     * @tc.name Test resetAspectRatio_Test_001
     * @tc.desc Unset the proportion of the window content layout
     */
    it('resetAspectRatio_Test_001', 0, async function (done) {
      let caseName = 'resetAspectRatio_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "resetAspectRatio_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        await windowClass.resetAspectRatio().then(() => {
          console.info(msgStr + 'Succeeded in resetting aspect ratio of window.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to reset the aspect ratio of window. Cause:' + JSON.stringify(err));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to reset the aspect ratio of window. catch Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300004);
        await windowClass.destroyWindow();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_GETPROPERTIES_JSAPI_001
     * @tc.name Test getProperties_Test_001
     * @tc.desc Gets the properties of the current window Continuous call interface
     */
    it('getProperties_Test_001', 0, async function (done) {
      let caseName = 'getProperties_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getProperties_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.getProperties().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining the window properties. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.getProperties(async (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in obtaining the window properties. Data: ' + JSON.stringify(data));
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETPROPERTIES_JSAPI_002
     * @tc.name Test getProperties_Test_002
     * @tc.desc Gets the properties of the current window Continuous call interface
     */
    it('getProperties_Test_002', 0, async function (done) {
      let caseName = 'getProperties_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getProperties_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.getProperties().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining the window properties. Data: ' + JSON.stringify(data));
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETAVOIDAREA_JSAPI_001
     * @tc.name Test getAvoidArea_Test_001
     * @tc.desc Gets the area where the window content is avoided
     */
    it('getAvoidArea_Test_001', 0, async function (done) {
      let caseName = 'getAvoidArea_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getAvoidArea_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.getAvoidArea(ohosWindow.AvoidAreaType.TYPE_SYSTEM).then((data) => {
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect(!!data).assertTrue();
      }).catch((err) => {
        console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.getAvoidArea(ohosWindow.AvoidAreaType.TYPE_CUTOUT, async (err, data) => {
        if (err.code) {
          console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect(!!data).assertTrue();
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETAVOIDAREA_JSAPI_002
     * @tc.name Test getAvoidArea_Test_002
     * @tc.desc Gets the area where the window content is avoided
     */
    it('getAvoidArea_Test_002', 0, async function (done) {
      let caseName = 'getAvoidArea_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getAvoidArea_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.getAvoidArea(6).then(async (data) => {
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch(async (err) => {
        console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1003);
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETAVOIDAREA_JSAPI_003
     * @tc.name Test getAvoidArea_Test_003
     * @tc.desc Gets the area where the window content is avoided
     */
    it('getAvoidArea_Test_003', 0, async function (done) {
      let caseName = 'getAvoidArea_Test_003';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "getAvoidArea_Test_003"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.getAvoidArea(ohosWindow.AvoidAreaType.TYPE_CUTOUT).then((data) => {
        console.info('Succeeded in obtaining the area. Data:' + JSON.stringify(data));
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to obtain the area. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_SETFULLSCREEN_JSAPI_001
     * @tc.name Test setFullScreen_Test_001
     * @tc.desc Sets whether the window layout is full-screen
     */
    it('setFullScreen_Test_001', 0, async function (done) {
      let caseName = 'setFullScreen_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setFullScreen_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setFullScreen(true).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.setFullScreen(false, async (err) => {
        if (err.code) {
          console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in enabling the full-screen mode.');
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_SETFULLSCREEN_JSAPI_002
     * @tc.name Test setFullScreen_Test_002
     * @tc.desc Sets whether the window layout is full-screen
     */
    it('setFullScreen_Test_002', 0, async function (done) {
      let caseName = 'setFullScreen_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setFullScreen_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.setFullScreen(true).then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_SETLAYOUTFULLSCREEN_JSAPI_001
     * @tc.name Test setLayoutFullScreen_Test_001
     * @tc.desc Sets whether the window layout is full-screen
     */
    it('setLayoutFullScreen_Test_001', 0, async function (done) {
      let caseName = 'setLayoutFullScreen_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setLayoutFullScreen_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setLayoutFullScreen(true).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.setLayoutFullScreen(false, async (err) => {
        if (err.code) {
          console.error('Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in setting the window layout to full-screen mode.');
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_SETLAYOUTFULLSCREEN_JSAPI_002
     * @tc.name Test setLayoutFullScreen_Test_002
     * @tc.desc Sets whether the window layout is full-screen
     */
    it('setLayoutFullScreen_Test_002', 0, async function (done) {
      let caseName = 'setLayoutFullScreen_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setLayoutFullScreen_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      await windowClass.setLayoutFullScreen(true).then(() => {
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to enable the full-screen mode. Cause: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_SETSYSTEMBARENABLE_TEST_JSAPI_001
     * @tc.name Test setSystemBarEnable_Test_001
     * @tc.desc Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     */
    it('setSystemBarEnable_Test_001', 0, async function (done) {
      let caseName = 'setSystemBarEnable_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setSystemBarEnable_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setSystemBarEnable([]).catch((err) => {
        console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.setSystemBarEnable(['status', 'navigation'], async (err) => {
        if (err.code) {
          console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        console.info('Succeeded in setting the system bar to be invisible.');
        await windowClass.destroyWindow();
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_SETSYSTEMBARENABLE_TEST_JSAPI_002
     * @tc.name Test setSystemBarEnable_Test_002
     * @tc.desc Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     */
    it('setSystemBarEnable_Test_002', 0, async function (done) {
      let caseName = 'setSystemBarEnable_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setSystemBarEnable_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      windowClass.setSystemBarEnable([]).then(() => {
        console.info('Succeeded in setting the system bar to be invisible.');
        expect().assertFail();
        done();
      }).catch((err) => {
        console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
        expect(err.code).assertEqual(1001);
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETMAINWINDOW_JSAPI_001
     * @tc.name Test getMainWindow_Test_001
     * @tc.desc Gets the main window under the WindowStage instance
     */
    it('getMainWindow_Test_001', 0, async function (done) {
      let caseName = 'getMainWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      await windowStage.getMainWindow().then((data) => {
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
        windowClass = data;
        expect(!!windowClass).assertTrue();
      }).catch((err) => {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowStage.getMainWindow((err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        windowClass2 = data;
        expect(!!windowClass2).assertTrue();
        done();
        console.info(msgStr + 'Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
      });
    })
    /**
     * @tc.number SUB_WINDOW_GETMAINWINDOWSYNC_JSAPI_001
     * @tc.name Test getMainWindowSync_Test_001
     * @tc.desc Gets the main window under the WindowStage instance
     */
    it('getMainWindowSync_Test_001', 0, async function (done) {
      let caseName = 'getMainWindowSync_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      try {
        windowClass = windowStage.getMainWindowSync();
        expect(!!windowClass).assertTrue();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
      try {
        windowClass2 = windowStage.getMainWindowSync();
        expect(!!windowClass2).assertTrue();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_CREATESUBWINDOW_JSAPI_001
     * @tc.name Test createSubWindow_Test_001
     * @tc.desc Create a child window under the WindowStage instance
     */
    it('createSubWindow_Test_001', 0, async function (done) {
      let caseName = 'createSubWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      try {
        await windowStage.createSubWindow('createSubWindow_Test_001_mySubWindow1').then((data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          windowClass = data;
          expect(!!windowClass).assertTrue();
        }).catch((err) => {
          console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
      try {
        windowStage.createSubWindow('createSubWindow_Test_001_mySubWindow2', async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
            }
            done();
            return;
          }
          windowClass2 = data;
          expect(!!windowClass2).assertTrue();
          await windowClass.destroyWindow();
          await windowClass2.destroyWindow();
          done();
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })
    /**
     * @tc.number SUB_WINDOW_GETSUBWINDOW_JSAPI_001
     * @tc.name Test getSubWindow_Test_001
     * @tc.desc Gets all the child Windows under the WindowStage instance
     */
    it('getSubWindow_Test_001', 0, async function (done) {
      let caseName = 'getSubWindow_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass = null;
      let windowClass2 = null;
      windowClass = await windowStage.getSubWindow().catch((err) => {
        console.error(msgStr + 'Failed to obtain the subwindow. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      windowStage.getSubWindow((err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to obtain the subwindow. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.log(msgStr + 'expect catch err: ' + JSON.stringify(error))
          }
          done();
          return;
        }
        windowClass2 = data;
        expect(!!windowClass2).assertTrue();
        done();
        console.info('Succeeded in obtaining the subwindow. Data: ' + JSON.stringify(data));
      });
    })
    /**
     * @tc.number SUB_WINDOW_ISWINDOWSUPPORTWIDEGAMUT_JSAPI_001
     * @tc.name Test isWindowSupportWideGamut_Test_001
     * @tc.desc Check whether the current window supports the wide color gamut mode
     */
    it('isWindowSupportWideGamut_Test_001', 0, async function (done) {
      let caseName = 'isWindowSupportWideGamut_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await windowStage.getMainWindow().catch(err => {
        expect().assertFail();
        done();
      });
      expect(!!windowClass).assertTrue();
      await windowClass.isWindowSupportWideGamut().catch((err) => {
        console.error('Failed to check whether the window support WideGamut. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      windowClass.isWindowSupportWideGamut(async (err, data) => {
        if (err.code) {
          console.error('Failed to check whether the window support WideGamut. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
          return;
        }
        console.info('Succeeded in checking whether the window support WideGamut Data: ' + JSON.stringify(data));
        done();
      });
    })
    /**
     * @tc.number SUB_WINDOW_ISWINDOWSHOWING_JSAPI_001
     * @tc.name Test isWindowShowing_Test_001
     * @tc.desc Check whether the current window is displayed
     */
    it('isWindowShowing_Test_001', 0, async function (done) {
      let caseName = 'isWindowShowing_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "isWindowShowing_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      try {
        let data = windowClass.isWindowShowing();
        expect(!data).assertTrue();
        console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data));
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      try {
        let data2 = windowClass.isWindowShowing();
        expect(!data2).assertTrue();
        await windowClass.destroyWindow();
        done();
        console.info('Succeeded in checking whether the window is showing. Data: ' + JSON.stringify(data2));
      } catch (exception) {
        console.error('Failed to check whether the window is showing. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETUICONTENT_TEST_JSAPI_001
     * @tc.name Test setUIContent_Test_001
     * @tc.desc Set the display direction property of the window
     */
    it('setUIContent_Test_001', 0, async function (done) {
      let caseName = 'setUIContent_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setUIContent_Test_001"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.destroyWindow();
      try {
        windowClass.setUIContent('MainAbility/pages/second/pageTwo', (err) => {
          if (err.code) {
            console.error('Failed to load the content. Cause:' + JSON.stringify(err));
            expect(err.code).assertEqual(1300002);
            done();
            return;
          }
          console.info('Succeeded in loading the content.');
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to load the content. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETUICONTENT_JSAPI_002
     * @tc.name Test setUIContent_Test_002
     * @tc.desc Set the display direction property of the window
     */
    it('setUIContent_Test_002', 0, async function (done) {
      let caseName = 'setUIContent_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setUIContent_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      await windowClass.setUIContent('MainAbility/pages/second/pageTwo').catch((err) => {
        console.error('Failed to load the content. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await windowClass.setUIContent('MainAbility/pages/second/pageOne').catch((err) => {
        console.error('Failed to load the content. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await windowClass.destroyWindow();
      done();
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_001
     * @tc.name Test setWindowSystemBarEnable_Test_001
     * @tc.desc Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     */
    it('setWindowSystemBarEnable_Test_001', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnable_Test_001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowClass;
      windowClass = await ohosWindow.getLastWindow(context).catch((err) => {
        console.error('Failed to obtain the top window. Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
        return;
      })
      expect(!!windowClass).assertTrue();
      // 后端采用遍历方式，获取有效值，所以用例成功
      let names = ['parmes', 'status', 'navigation'];
      try {
        windowClass.setWindowSystemBarEnable(names).then(async () => {
          console.info('Succeeded in setting the system bar to be invisible.');
          done();
        }).catch((err) => {
          console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to set the system bar to be invisible. catch Cause:' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number SUB_WINDOW_SETWINDOWSYSTEMBARENABLE_JSAPI_002
     * @tc.name Test setWindowSystemBarEnable_Test_002
     * @tc.desc Set the visibility mode of the navigation bar and status bar when the window is in full-screen mode
     */
    it('setWindowSystemBarEnable_Test_002', 0, async function (done) {
      let caseName = 'setWindowSystemBarEnable_Test_002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = "setWindowSystemBarEnable_Test_002"
      let windowConfig = {
        name: windowId, windowType: 1, ctx: context
      };
      let windowClass=null;
      windowClass = await ohosWindow.createWindow(windowConfig).catch((err) => {
        console.log(msgStr + 'Window createWindow err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      expect(!!windowClass).assertTrue();
      let names = ['status', 'navigation'];
      await windowClass.destroyWindow();
      try {
        windowClass.setWindowSystemBarEnable(names).then(() => {
          console.info('Succeeded in setting the system bar to be invisible.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error('Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(1300002);
          done();
        });
      } catch (exception) {
        console.error('Failed to set the system bar to be invisible. catch Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002);
        done();
      }
    })
  })
}
