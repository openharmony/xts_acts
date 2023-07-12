/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function Window() {
  describe("Window", function () {
    let context;
    let windowStage;
    let storage;
    const TRUE_FLAG = true;

    beforeAll(async function () {
      console.info("beforeAll case");
      context = globalThis.abilityContext;
      windowStage = globalThis.windowStage;
      storage = new LocalStorage();
      storage.setOrCreate('storageSimpleProp', 121);
    });

    beforeEach(async function () {
      console.info("beforeEach case");
    });

    afterEach(async function () {
      console.info('afterEach case');
    });

    afterAll(async function () {
      console.info("afterAll case");
    });

    function expectedError(error, caseName, apiName, done, code) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {
        expect(error.code).assertEqual(code);
        console.info(caseName + " success");
        done();
      } catch (error) {
        console.info(caseName + " fail: " + error);
        expect().assertFail();
        done();
      }
    }

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {
        expect(true).assertFail();
      } catch (error) {
        console.info(`unexpectedError catch error: ${JSON.stringify(error)}`)
      }
      done();
    }

    /**
     * @tc.number    : TEST_FINDWINDOW_001
     * @tc.name      : testFindWindow001
     * @tc.desc      : test find window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testFindWindow001', 0, async function (done) {
      try {
        let caseName = 'testFindWindow001';
        let msgStr = 'jsunittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let ohosData;
        try {
          ohosData = await windowStage.createSubWindow('testFindWindow001');
          expect(!!ohosData).assertTrue();
        } catch (exception) {
          console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        }
        let windowClass = window.findWindow("testFindWindow001");
        expect(windowClass != undefined).assertTrue();
        console.info('testFindWindow001 success');
        await windowClass.destroyWindow();
        done();
      } catch (error) {
        expect(error.code).assertEqual(401);
        console.error('testFindWindow001 Failed to find the Window. Cause: ' + JSON.stringify(error));
        done();
      }
    })
    /**
     * @tc.number    : TEST_FINDWINDOW_002
     * @tc.name      : testFindWindow002
     * @tc.desc      : test find window no exist
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testFindWindow002', 0, async function (done) {
      try {
        window.findWindow('alertWindow');
        expect(false).assertTrue();
        console.info('testFindWindow002 fail');
        done();
      } catch (error) {
        expect(error.code).assertEqual(1300002);
        console.error('testFindWindow002 Failed to find the Window. Cause: ' + JSON.stringify(error));
        done();
      }
    })

    /**
     * @tc.number    : TEST_GETLASTWINDOW_PROMISE_001
     * @tc.name      : testGetLastWindowPromise001
     * @tc.desc      : get the final show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetLastWindowPromise001', 0, async function (done) {
      let caseName = 'testGetLastWindowPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowData = await windowStage.createSubWindow('testGetLastWindowPromise001');
        await windowData.showWindow();
        let lastWindow = await window.getLastWindow(context);
        expect(lastWindow != null).assertTrue();
        await windowData.destroyWindow();
        done();
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_GETLASTWINDOW_CB_001
     * @tc.name      : testGetLastWindowCb001
     * @tc.desc      : get the final show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetLastWindowCb001', 0, async function (done) {
      let caseName = 'testGetLastWindowCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let windowData = await windowStage.createSubWindow('testGetLastWindowCb001');
        await windowData.showWindow();
        window.getLastWindow(context, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.info(msgStr + `window.getLastWindow  catch error: ${JSON.stringify(error)}`)
            }
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
          expect(data != null).assertTrue();
          await windowData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
    })

    /**
     * @tc.number    : TEST_SHOWWINDOW_PROMISE_001
     * @tc.name      : testShowWindowPromise001
     * @tc.desc      : show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testShowWindowPromise001', 0, async function (done) {
      let caseName = 'testShowWindowPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      try {
        tempWnd = await windowStage.createSubWindow('testShowWindowPromise001');
        expect(!!tempWnd).assertTrue();
        await tempWnd.showWindow().then(async (data) => {
          console.info(msgStr + 'Succeeded in showing the window. Data: ' + JSON.stringify(data));
          await tempWnd.destroyWindow();
          done();
        }).catch((err) => {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SHOWWINDOW_CB_001
     * @tc.name      : testShowWindowCb001
     * @tc.desc      : show window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testShowWindowCb001', 0, async function (done) {
      let caseName = 'testShowWindowCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let winData;
      winData = await windowStage.createSubWindow('testShowWindowCb001');
      expect(!!winData).assertTrue();
      winData.showWindow(async (err, data) => {
        if (err.code) {
          console.error(msgStr + 'Failed to show the window. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (err) {
            console.info(msgStr + `window.showWindow catch error: ${JSON.stringify(err)}`)
          }
          done();
          return;
        }
        console.info(msgStr + 'Succeeded in showing the window. Data: ' + JSON.stringify(data));
        await winData.destroyWindow();
        done();
      })
    })

    /**
     * @tc.number    : TEST_DESTROYWINDOW_PROMISE_001
     * @tc.name      : testDestroyWindowPromise001
     * @tc.desc      : Verification window destruction scenario
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testDestroyWindowPromise001', 0, async function (done) {
      let caseName = 'testDestroyWindowPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testDestroyWindowPromise001';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      try {
        tempWnd = await windowStage.createSubWindow(windowId);
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroyWindow().then(() => {
          console.info(msgStr + 'Succeeded in destroying the window.');
          try {
            let findWnd = window.findWindow(windowId)
            expect(!findWnd).assertTrue();
            done();
          } catch (exception) {
            console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
            expect(exception.code).assertEqual(1300002);
            done();
          }
        }).catch((err) => {
          console.error(msgStr + 'try catch Failed to destroy the window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_DESTROYWINDOW_CB_001
     * @tc.name      : testDestroyWindowCb001
     * @tc.desc      : Verification window destruction scenario
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testDestroyWindowCb001', 0, async function (done) {
      let caseName = 'testDestroyWindowCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testDestroyWindowCb001';
      console.log(msgStr + 'begin');

      let winData;
      winData = await windowStage.createSubWindow(windowId);
      expect(!!winData).assertTrue();
      winData.destroyWindow((err) => {
        if (err.code != 0) {
          console.log('windowTest DestroyTest2 create callback fail' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (err) {
            console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
          }
        } else {
          try {
            let findWnd = window.findWindow(windowId)
            expect(!findWnd).assertTrue();
          } catch (exception) {
            console.error(msgStr + 'try catch Failed to find the Window. Cause: ' + JSON.stringify(exception));
            expect(exception.code).assertEqual(1300002);
          }
        }
        done();
      })
    })

    /**
     * @tc.number    : TEST_MOVEWINDOWTO_PROMISE_001
     * @tc.name      : testMoveWindowToPromise001
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToPromise001', 0, async function (done) {
      let caseName = 'testMoveWindowToPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testMoveWindowToPromise001';
      console.log(msgStr + 'begin');
      try {
        windowStage.createSubWindow(windowId).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.showWindow();
            wnd.moveWindowTo(300, 300).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_MOVEWINDOWTO_PROMISE_002
     * @tc.name      : testMoveWindowToPromise002
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToPromise002', 0, async function (done) {
      let caseName = 'testMoveWindowToPromise002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testMoveWindowToPromise002';
      console.log(msgStr + 'begin');
      try {
        await windowStage.createSubWindow(windowId).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.showWindow();
            wnd.moveWindowTo(100, 50).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_MOVEWINDOWTO_PROMISE_003
     * @tc.name      : testMoveWindowToPromise003
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToPromise003', 0, async function (done) {
      let caseName = 'testMoveWindowToPromise003';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testMoveWindowToPromise003';
      console.log(msgStr + 'begin');
      try {
        await windowStage.createSubWindow(windowId).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.showWindow();
            wnd.moveWindowTo(20000, 20000).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_MOVEWINDOWTO_PROMISE_004
     * @tc.name      : testMoveWindowToPromise004
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToPromise004', 0, async function (done) {
      let caseName = 'testMoveWindowToPromise004';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testMoveWindowToPromise004';
      console.log(msgStr + 'begin');
      try {
        await windowStage.createSubWindow(windowId).then(async (wnd) => {
          console.info(msgStr + 'Succeeded in obtaining the top window. Data: ' + JSON.stringify(wnd));
          expect(wnd != null).assertTrue();
          try {
            await wnd.showWindow();
            wnd.moveWindowTo(-200, -200).then(async () => {
              console.info(msgStr + 'Succeeded in moving the window.');
              await wnd.destroyWindow();
              done();
            }).catch(async (err) => {
              console.error(msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
              expect().assertFail();
              await wnd.destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
            expect().assertFail();
            done();
          }
        }).catch((err) => {
          console.error(msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_MOVEWINDOWTO_CB_001
     * @tc.name      : testMoveWindowToCb001
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToCb001', 0, async function (done) {
      let caseName = 'testMoveWindowToCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testMoveWindowToCb001';

      let winData;
      winData = await windowStage.createSubWindow(windowId);
      expect(!!winData).assertTrue();
      try {
        await winData.showWindow();
        winData.moveWindowTo(300, 300, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'window.moveWindow catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : TEST_MOVEWINDOWTO_CB_002
     * @tc.name      : testMoveWindowToCb002
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToCb002', 0, async function (done) {
      let caseName = 'testMoveWindowToCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testMoveWindowToCb002';

      let winData;
      winData = await windowStage.createSubWindow(windowId);
      expect(!!winData).assertTrue();
      try {
        await winData.showWindow();
        winData.moveWindowTo(100, 50, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : TEST_MOVEWINDOWTO_CB_003
     * @tc.name      : testMoveWindowToCb003
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToCb003', 0, async function (done) {
      let caseName = 'testMoveWindowToCb003';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testMoveWindowToCb003';

      let winData;
      winData = await windowStage.createSubWindow(windowId);
      expect(!!winData).assertTrue();
      try {
        await winData.showWindow();
        winData.moveWindowTo(20000, 20000, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : TEST_MOVEWINDOWTO_CB_004
     * @tc.name      : testMoveWindowToCb004
     * @tc.desc      : Set the position of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testMoveWindowToCb004', 0, async function (done) {
      let caseName = 'testMoveWindowToCb004';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testMoveWindowToCb004';

      let winData;
      winData = await windowStage.createSubWindow(windowId);
      expect(!!winData).assertTrue();
      try {
        await winData.showWindow();
        winData.moveWindowTo(-200, -200, async (err, data) => {
          if (err.code) {
            console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in moving the window. Data: ' + JSON.stringify(data));
          await winData.destroyWindow();
          done();
        })
      } catch (exception) {
        console.error(msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
      }
    })

    /**
     * @tc.number    : TEST_RESIZE_PROMISE_001
     * @tc.name      : testResizePromise001
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testResizePromise001', 0, async function (done) {
      let caseName = 'testResizePromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testResizePromise001';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      try {
        tempWnd = await windowStage.createSubWindow(windowId);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.showWindow();
          await tempWnd.resize(200, 600).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_RESIZE_PROMISE_002
     * @tc.name      : testResizePromise002
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testResizePromise002', 0, async function (done) {
      let caseName = 'testResizePromise002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testResizePromise002';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      try {
        tempWnd = await windowStage.createSubWindow(windowId);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.showWindow();
          await tempWnd.resize(20000, 20000).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect().assertFail();
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_RESIZE_PROMISE_003
     * @tc.name      : testResizePromise003
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testResizePromise003', 0, async function (done) {
      let caseName = 'testResizePromise003';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testResizePromise003';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      try {
        tempWnd = await windowStage.createSubWindow(windowId);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.showWindow();
          await tempWnd.resize(0, 0).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          await tempWnd.destroyWindow();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_RESIZE_PROMISE_004
     * @tc.name      : testResizePromise004
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testResizePromise004', 0, async function (done) {
      let caseName = 'testResizePromise004';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testResizePromise004';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      try {
        tempWnd = await windowStage.createSubWindow(windowId);
        expect(!!tempWnd).assertTrue();
        try {
          await tempWnd.showWindow();
          await tempWnd.resize(-1, -1).then(async (data) => {
            console.info(msgStr + 'Succeeded in changing the window size. Data:' + JSON.stringify(data));
            await tempWnd.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            await tempWnd.destroyWindow();
            done();
          })
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to change the window size. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          await tempWnd.destroyWindow();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_RESIZE_PROMISE_005
     * @tc.name      : testResizePromise005
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testResizePromise005', 0, async function (done) {
      let caseName = 'testResizePromise005';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testResizePromise005';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      try {
        tempWnd = await windowStage.createSubWindow(windowId);
        expect(!!tempWnd).assertTrue();
        await tempWnd.showWindow();
        for (let i = 0; i < 5; i++) {
          console.log(msgStr + 'begin resize current step:' + i)
          await tempWnd.resize(100, 100).catch((err) => {
            console.error(msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(6);
            done()
            return;
          })
          console.log(msgStr + 'success resize current step:' + i)
          if (i == 4) {
            console.log(msgStr + 'finish resize current step:' + i)
            done()
          }
        }
        await tempWnd.destroyWindow();
      } catch (exception) {
        console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : TEST_RESIZE_CB_001
     * @tc.name      : testResizeCb001
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testResizeCb001', 0, async function (done) {
      let caseName = 'testResizeCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testResizeCb001';

      let winData;
      winData = await windowStage.createSubWindow(windowId);
      expect(!!winData).assertTrue();
      await winData.showWindow();
      try {
        winData.resize(200, 200, async (err) => {
          if (err.code) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (err) {
              console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
            }
            await winData.destroyWindow();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in changing the window size.');
          await winData.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : TEST_RESIZE_CB_002
     * @tc.name      : testResizeCb002
     * @tc.desc      : Set the size of a window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testResizeCb002', 0, async function (done) {
      let caseName = 'testResizeCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'testResizeCb002';

      function resizeFun(width, height, i) {
        console.log(msgStr + 'resize begin step:' + i)
        return new Promise((resolve, reject) => {
          try {
            winData.resize(width, height, async (err) => {
              if (err.code) {
                console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
                try {
                  expect().assertFail();
                } catch (err) {
                  console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
                }
                done();
                reject(null)
              }
              console.info(msgStr + 'Succeeded in changing the window size. step:' + i);
              resolve(true)
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
          }
        })
      }

      let winData;
      winData = await windowStage.createSubWindow(windowId);
      expect(!!winData).assertTrue();
      await winData.showWindow();
      let width = 100;
      let height = 100;
      for (let i = 1; i < 5; i++) {
        width = width * i;
        height = height * i;
        await resizeFun(width, height, i);
        if (i == 4) {
          console.log(msgStr + 'resize finished step:' + i)
          await winData.destroyWindow();
          done()
        }
      }
    })

    /**
     * @tc.number    : TEST_GETWINDOWPROPERTIES_001
     * @tc.name      : testGetWindowProperties001
     * @tc.desc      : Gets the properties of the current window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetWindowProperties001', 0, async function (done) {
      let caseName = 'testGetWindowProperties001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let data = tempWnd.getWindowProperties();
          console.log(msgStr + 'window.getWindowProperties ' + JSON.stringify(data));
          expect(data.type != null).assertTrue();
          expect(data.windowRect.height != null).assertTrue();
          expect(data.windowRect.left != null).assertTrue();
          expect(data.windowRect.top != null).assertTrue();
          expect(data.windowRect.width != null).assertTrue();
          expect(data.isKeepScreenOn != null).assertTrue();
          expect(data.brightness != null).assertTrue();
          done();
        } catch (exception) {
          console.error(msgStr + 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the main window. Cause: ' + JSON.stringify(exception));
      }
    })

    /**
     * @tc.number    : TEST_SETWINDOWSYSTEMBARENABLE_PROMISE_001
     * @tc.name      : testSetWindowSystemBarEnablePromise001
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowSystemBarEnablePromise001', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnablePromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await window.getLastWindow(context);
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable([]).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(true).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWSYSTEMBARENABLE_PROMISE_002
     * @tc.name      : testSetWindowSystemBarEnablePromise002
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowSystemBarEnablePromise002', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnablePromise002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await window.getLastWindow(context);
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable(['status', 'navigation']).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(true).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWSYSTEMBARENABLE_PROMISE_003
     * @tc.name      : testSetWindowSystemBarEnablePromise003
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowSystemBarEnablePromise003', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnablePromise003';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await window.getLastWindow(context);
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable(['status']).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(TRUE_FLAG).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWSYSTEMBARENABLE_PROMISE_004
     * @tc.name      : testSetWindowSystemBarEnablePromise004
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowSystemBarEnablePromise004', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnablePromise004';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let wnd = null;
      try {
        wnd = await window.getLastWindow(context);
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable(['navigation']).then(() => {
            console.info(msgStr + 'Succeeded in setting the system bar to be invisible.');
            expect(TRUE_FLAG).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + 'Failed to set the system bar to be invisible. Cause:' + JSON.stringify(err));
            expect().assertFail();
            done();
          });
        } catch (exception) {
          console.error(msgStr + 'try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
          expect().assertFail();
          done();
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : TEST_SETWINDOWSYSTEMBARENABLE_CB_001
     * @tc.name      : testSetWindowSystemBarEnableCb001
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowSystemBarEnableCb001', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnableCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wnd = null;
      try {
        wnd = await window.getLastWindow(context);
        expect(wnd != null).assertTrue();
        try {
          wnd.setWindowSystemBarEnable(['status', 'navigation'], (err) => {
            console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen(true) callback begin');
            if (err.code != 0) {
              console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen callback fail' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (err) {
                console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
              }
              done();
              return;
            }
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (err) {
              console.log(msgStr + 'assertTrue catch' + JSON.stringify(err));
            }
            done();
          })
        } catch (exception) {
          console.error(msgStr + ' try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to get the last window. Cause: ' + JSON.stringify(exception));
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWSYSTEMBARENABLE_CB_002
     * @tc.name      : testSetWindowSystemBarEnableCb002
     * @tc.desc      : Set the visible mode of navigation bar and status bar
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowSystemBarEnableCb002', 0, async function (done) {
      let caseName = 'testSetWindowSystemBarEnableCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let wnd = null;
      try {
        wnd = await window.getLastWindow(context);
        expect(wnd != null).assertTrue();
        try {
          await wnd.setWindowSystemBarEnable([], (err) => {
            console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen(true) callback begin');
            if (err.code != 0) {
              console.log(msgStr + 'windowTest SetLayoutFullScreenTest2 wnd.setFullScreen callback fail' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (err) {
                console.log(msgStr + 'assertFail catch' + JSON.stringify(err));
              }
              done();
              return;
            }
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (err) {
              console.log(msgStr + 'assertTrue catch' + JSON.stringify(err));
            }
            done();
          })
        } catch (exception) {
          console.error(msgStr + ' try catch Failed to set the system bar to be invisible. Cause:' + JSON.stringify(exception));
        }
      } catch (exception) {
        console.error(msgStr + 'try catch Failed to get the last window. Cause: ' + JSON.stringify(exception));
      }
    })

    /**
     * @tc.number    : TEST_SETPREFERREDORIENTATION_PROMISE_001
     * @tc.name      : testSetPreferredOrientationPromise001
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetPreferredOrientationPromise001', 0, async function (done) {
      let caseName = 'testSetPreferredOrientationPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = await windowStage.getMainWindow();
      console.log(msgStr + 'windowStage.getMainWindow :' + JSON.stringify(mainWin));
      expect(!!mainWin).assertTrue();
      let num = 0
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
        'LANDSCAPE_INVERTED'];
      for (let i = 0; i < orientationItem.length; i++) {
        let orientation = window.Orientation[orientationItem[i]]
        console.log(msgStr + 'i : ' + i + ' ,orientation : ' + orientation);
        console.log(msgStr + 'i : ' + i + ' ,window.Orientation : ' + JSON.stringify(window.Orientation));
        await mainWin.setPreferredOrientation(orientation).then(() => {
          console.log(msgStr + 'success set window.setPreferredOrientation : ' + orientation);
          num++
          if (num == orientationItem.length) done();
        }).catch(err => {
          console.log(msgStr + 'window.setPreferredOrientation failed set error:' + orientation);
        });
      }
    })
    /**
     * @tc.number    : TEST_SETPREFERREDORIENTATION_CB_001
     * @tc.name      : testSetPreferredOrientationCb001
     * @tc.desc      : Sets the display direction property of the window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetPreferredOrientationCb001', 0, async function (done) {
      let caseName = 'testSetPreferredOrientationCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = null;
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
        'LANDSCAPE_INVERTED'];

      function setPreferredOrientationFun(win, orientation) {
        return new Promise((resolve, reject) => {
          try {
            win.setPreferredOrientation(orientation, (err) => {
              if (err.code) {
                console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(err));
                reject(null)
              } else {
                console.info(msgStr + 'Succeeded in setting window orientation.');
                resolve(true)
              }
            });
          } catch (exception) {
            console.error(msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
            reject(null)
          }
        })
      }

      mainWin = await windowStage.getMainWindow();
      expect(!!mainWin).assertTrue();
      for (let i = 0; i < orientationItem.length; i++) {
        let orientation = window.Orientation[orientationItem[i]]
        await setPreferredOrientationFun(mainWin, orientation).catch((err) => {
          console.error(msgStr + 'Failed to obtain the main window. Cause: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.info(msgStr + 'Succeeded in setting window orientation. orientation: ' + orientation + "step: " + i);
        if (i == orientationItem.length - 1) {
          expect(true).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.number    : TEST_LOADCONTENT_PROMISE_001
     * @tc.name      : testLoadContentPromise001
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentPromise001', 0, async function (done) {
      let caseName = 'testLoadContentPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testLoadContentPromise001';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      tempWnd = await windowStage.createSubWindow(windowId);
      expect(!!tempWnd).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent start');
      let load = await tempWnd.loadContent('pages/second/second', storage).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.loadContent', done);
        console.log(msgStr + 'tempWnd.loadContent(pages/second/second) err=' + JSON.stringify(err));
      });
      console.log(msgStr + 'tempWnd.loadContent(pages/second/second) load=' + JSON.stringify(load));
      expect(!load).assertTrue();
      await tempWnd.destroyWindow();
      done();
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_PROMISE_002
     * @tc.name      : testLoadContentPromise002
     * @tc.desc      : Verify the scene of loading the page with illegal values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentPromise002', 0, async function (done) {
      let caseName = 'testLoadContentPromise002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testLoadContentPromise002';
      console.log(msgStr + 'begin');
      let tempWnd = null;
      tempWnd = await windowStage.createSubWindow(windowId);
      expect(!!tempWnd).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent start');
      await tempWnd.destroyWindow();
      let errFlag = false;
      try {
        await tempWnd.loadContent(null, storage);
        expect().assertFail();
        done();
      } catch (err) {
        errFlag = true;
        expectedError(err, caseName, 'tempWnd.loadContent', done, 401);
        console.log(msgStr + 'tempWnd.loadContent(null)' + JSON.stringify(err));
      }
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_CB_001
     * @tc.name      : testLoadContentCb001
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentCb001', 0, async function (done) {
      let caseName = 'testLoadContentCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testLoadContentCb001';
      console.log(msgStr + 'begin');
      let tempWnd = null

      tempWnd = await windowStage.createSubWindow(windowId);
      expect(!!tempWnd).assertTrue();

      tempWnd.loadContent('pages/index', storage, async (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'tempWnd.loadContent', done);
        } else {
          try {
            expect(!data).assertTrue();
          } catch (error) {
            console.info(`tempWnd.loadContent catch error: ${JSON.stringify(error)}`)
          }
          await tempWnd.destroyWindow();
          done()
        }
      })
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_CB_002
     * @tc.name      : testLoadContentCb002
     * @tc.desc      : Verify the scene of loading the page with illegal values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentCb002', 0, async function (done) {
      let caseName = 'testLoadContentCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let windowId = 'testLoadContentCb002';
      console.log(msgStr + 'begin');
      let tempWnd = null
      tempWnd = await windowStage.createSubWindow(windowId);
      expect(!!tempWnd).assertTrue();
      try {
        tempWnd.loadContent(null, storage, async (err, data) => {
          if (err && err.code) {
            try {
              expect(err.code === 401).assertTrue();
            } catch (error) {
              console.info(`tempWnd.loadContent catch error: ${JSON.stringify(error)}`)
            }
            await tempWnd.destroyWindow();
            done()
          } else {
            await tempWnd.destroyWindow();
            unexpectedError(err, caseName, 'tempWnd.loadContent', done);
          }
        })
      } catch (err) {
        try {
          expect(err.code === 401).assertTrue();
        } catch (error) {
          console.info(`tempWnd.loadContent catch error: ${JSON.stringify(error)}`)
        }
        await tempWnd.destroyWindow();
        done()
      }
    })
    /**
     * @tc.number    : testGetUIContext001
     * @tc.name      : testGetUIContext001
     * @tc.desc      : test getUIContext
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetUIContext001', 0, async function (done) {
      windowStage.getMainWindow((err, data) => {
        if (err.code) {
          console.error('testGetUIContext001 Failed to obtain the main window. Cause: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        } else {
          console.info('testGetUIContext001 Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));
          expect(data != undefined).assertTrue();
          let UIContext = data.getUIContext();
          expect(UIContext != undefined).assertTrue();
          console.info('testGetUIContext001 Succeeded');
          done();
        }
      })
    })
    /**
     * @tc.number    : TEST_SETUICONTENT_PROMISE_001
     * @tc.name      : testSetUIContentPromise001
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetUIContentPromise001', 0, async function (done) {
      let win;
      try {
        win = await windowStage.createSubWindow('testSetUIContentPromise001');
        expect(win != null);
        await win.setUIContent('pages/second/second').then(async () => {
          console.info('setUIContent1 . Cause: success');
          expect(TRUE_FLAG).assertTrue();
          await win.destroyWindow();
          done();
        }).catch(async (err) => {
          console.error('Failed to setUIContent . Cause:' + JSON.stringify(err));
          expect().assertFail();
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error('Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETUICONTENT_PROMISE_002
     * @tc.name      : testSetUIContentPromise002
     * @tc.desc      : Verify the scene of loading the page with illegal values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetUIContentPromise002', 0, async function (done) {
      let win;
      try {
        win = await windowStage.createSubWindow('testSetUIContentPromise002');
        expect(win != null).assertTrue();
        try {
          await win.setUIContent(null).then(async () => {
            console.info('Succeeded in loading the content.');
            expect().assertFail();
            await win.destroyWindow();
            done();
          }).catch(async (err) => {
            console.error('Failed to load the content. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            await win.destroyWindow();
            done()
          });
        } catch (exception) {
          console.error('Failed to load the content. exception: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          await win.destroyWindow();
          done()
        }
      } catch (exception) {
        console.error('Failed to create the window2. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETUICONTENT_PROMISE_003
     * @tc.name      : testSetUIContentPromise003
     * @tc.desc      : Verify the scene of loading the page with illegal values
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetUIContentPromise003', 0, async function (done) {
      let win;
      try {
        win = await windowStage.createSubWindow('testSetUIContentPromise003');
        expect(win != null).assertTrue();
        await win.setUIContent('pages/second/he').then(async () => {
          console.info('setUIContent3 . Cause: success');
          expect(TRUE_FLAG).assertTrue();
          await win.destroyWindow();
          done();
        }).catch(async (err) => {
          console.error('Failed to setUIContent3 . Cause:' + JSON.stringify(err));
          expect().assertFail();
          await win.destroyWindow();
          done();
        });
      } catch (exception) {
        console.error('Failed to create the window3. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETUICONTENT_CB_001
     * @tc.name      : testSetUIContentCb001
     * @tc.desc      : Verify the scenario of loading an existing page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetUIContentCb001', 0, async function (done) {
      let winData;
      winData = await windowStage.createSubWindow('testSetUIContentCb001');
      expect(!!winData).assertTrue();
      try {
        winData.setUIContent('pages/second/second', async (err) => {
          try {
            if (err.code) {
              console.error('Failed to load the content callback. Cause:' + JSON.stringify(err));
              expect().assertFail();

            } else {
              console.info('Succeeded in loading the content.');
              expect(TRUE_FLAG).assertTrue();
            }
          } catch (err) {
            console.log('setUIContentTestCallBack1 assert result catch' + JSON.stringify(err));
          }
          done();
          await winData.destroyWindow();
        });
      } catch (exception) {
        console.error('Failed callback to load the content. Cause:' + JSON.stringify(exception));
        expect().assertFail();
        await winData.destroyWindow();
        done();
      }
    })

    /**
     * @tc.number    : TEST_ISWINDOWSHOWING_001
     * @tc.name      : testIsWindowShowing001
     * @tc.desc      : To verify the widow isshowing
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testIsWindowShowing001', 0, async function (done) {
      console.info('windowTest isWindowShowing begin');
      let wnd;
      wnd = await windowStage.createSubWindow('testIsWindowShowing001');
      expect(wnd != null).assertTrue();
      let isWindowShowing = wnd.isWindowShowing();
      expect(!isWindowShowing).assertTrue();
      await wnd.showWindow().then(async () => {
        let isWindowShowing2 = wnd.isWindowShowing();
        expect(isWindowShowing2).assertTrue();
        await wnd.destroyWindow();
        done();
      }).catch(async (err) => {
        console.error('Failed to show window1. Cause:' + JSON.stringify(err));
        expect().assertFail();
        await wnd.destroyWindow();
        done();
      })
    })

    /**
     * @tc.number    : TEST_SETWINDOWBACKGROUNDCOLOR_001
     * @tc.name      : testSetWindowBackgroundColor001
     * @tc.desc      : Set the window background color to red and Default opacity
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBackgroundColor001', 0, async function (done) {
      console.info('windowTest testSetWindowBackgroundColor001 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#00ff33';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
        try {
          let properties = wnd.getWindowProperties();
          expect(!properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties001. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done();
        }
      } catch (exception) {
        console.error('Failed to set the background1 color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBACKGROUNDCOLOR_002
     * @tc.name      : testSetWindowBackgroundColor002
     * @tc.desc      : Set the window background color to red opaque
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBackgroundColor002', 0, async function (done) {
      console.info('windowTest testSetWindowBackgroundColor002 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#ffffff00';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
        try {
          let properties = wnd.getWindowProperties();
          expect(!properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties002. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done();
        }
      } catch (exception) {
        console.error('Failed to set the background2 color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBACKGROUNDCOLOR_003
     * @tc.name      : testSetWindowBackgroundColor003
     * @tc.desc      : Set the window background color to red transparent
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBackgroundColor003', 0, async function (done) {
      console.info('windowTest testSetWindowBackgroundColor003 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#00ffff00';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
        try {
          let properties = wnd.getWindowProperties();
          expect(properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties003. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done();
        }
      } catch (exception) {
        console.error('Failed to set the background3 color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBACKGROUNDCOLOR_004
     * @tc.name      : testSetWindowBackgroundColor004
     * @tc.desc      : Set the background color input parameter as an outlier
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBackgroundColor004', 0, async function (done) {
      console.info('windowTest testSetWindowBackgroundColor004 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#ff00';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
      } catch (exception) {
        console.error('Failed to set the background4 color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBACKGROUNDCOLOR_005
     * @tc.name      : testSetWindowBackgroundColor005
     * @tc.desc      : Setting window background color input exception ARGB
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBackgroundColor005', 0, async function (done) {
      console.info('windowTest testSetWindowBackgroundColor005 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#hhgghhgg';
      try {
        wnd.setWindowBackgroundColor(color);
        try {
          let properties = wnd.getWindowProperties();
          expect(!properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties005. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done()
        }
      } catch (exception) {
        console.error('Failed to set the background5 color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_PROMISE_001
     * @tc.name      : testSetWindowBrightnessPromise001
     * @tc.desc      : Setting the brightness bar input parameter is normal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessPromise001', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessPromise001 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowBrightness(0).catch((err) => {
        console.info('windowTest setWindowBrightnessTest1 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      let data = wnd.getWindowProperties();
      expect(data.brightness).assertEqual(0);
      await wnd.setWindowBrightness(0.5).catch((err) => {
        console.log('windowTest setBrightnessTest1 setWindowBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      let data1 = wnd.getWindowProperties();
      expect(data1.brightness).assertEqual(0.5);
      await wnd.setWindowBrightness(1).then(() => {
        console.info('windowTest setWindowBrightnessTest1 setBrightness(1) success ');
        let data2 = wnd.getWindowProperties();
        expect(data2.brightness).assertEqual(1);
        done();
      }, (err) => {
        console.log('windowTest setWindwoBrightnessTest1 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_PROMISE_002
     * @tc.name      : testSetWindowBrightnessPromise002
     * @tc.desc      : Set the brightness bar input parameter to decimal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessPromise002', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessPromise002 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowBrightness(0.564789).then(() => {
        console.log('windowTest setBrightnessTest2 setBrightness(0.564789) success ');
        expect(TRUE_FLAG).assertTrue();
        done();
      }, (err) => {
        console.log('windowTest setWindowBrightnessTest2 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_PROMISE_003
     * @tc.name      : testSetWindowBrightnessPromise003
     * @tc.desc      : Set the brightness bar input parameter to number max
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessPromise003', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessPromise003 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let brightness = Number.MAX_VALUE;
      try {
        let promise = wnd.setWindowBrightness(brightness);
        await promise.then(() => {
          console.info('Succeeded3 in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error('Failed3 to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error('Failed3 to set the brightnessexception. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_PROMISE_004
     * @tc.name      : testSetWindowBrightnessPromise004
     * @tc.desc      : Set the brightness bar input parameter to number min
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessPromise004', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessPromise004 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowBrightness(Number.MIN_VALUE).then(() => {
        console.info('windowTest setWindowBrightnessTest3 setBrightness(Number.MAX_VALUE) success ');
        expect(TRUE_FLAG).assertTrue();
        done();
      }, (err) => {
        console.info('windowTest setWindowBrightnessTest4 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_PROMISE_005
     * @tc.name      : testSetWindowBrightnessPromise005
     * @tc.desc      : Setting brightness bar input parameter exception
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessPromise005', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessPromise005 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let brightness = 1.1;
      try {
        let promise = wnd.setWindowBrightness(brightness);
        await promise.then(() => {
          console.info('Succeeded5 in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error('Failed5 to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
        });
      } catch (exception) {
        console.error('Failed5 to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }

      try {
        let promise = wnd.setWindowBrightness(-0.5);
        await promise.then(() => {
          console.info('Succeeded55 in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error('Failed55 to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error('Failed55 to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_CB_001
     * @tc.name      : testSetWindowBrightnessCb001
     * @tc.desc      : Setting the brightness bar input parameter is normal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessCb001', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessCb001 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowBrightness(1, (err) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback01. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            try {
              let properties = wnd.getWindowProperties();
              try {
                expect(properties.brightness).assertEqual(1);
              } catch (error) {
                console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
              }
              done();
            } catch (exception) {
              console.error('Failed04 to obtain the window properties. Cause: ' + JSON.stringify(exception));
              try {
                expect(exception.code).assertEqual(401);
              } catch (error) {
                console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
              }
              done();
            }
          }
        });
      } catch (exception) {
        console.error('Failedca02 to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_CB_002
     * @tc.name      : testSetWindowBrightnessCb002
     * @tc.desc      : Set the brightness bar input parameter to decimal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessCb002', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessCb002 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowBrightness(0.564789, (err) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback02. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            try {
              console.log('windowTest setBrightnessTest2 setBrightness(0.564789) success ');
              expect(TRUE_FLAG).assertTrue();
              done();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
          }
        });
      } catch (exception) {
        console.error('Failedca02 to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_CB_003
     * @tc.name      : testSetWindowBrightnessCb003
     * @tc.desc      : Set the brightness bar input parameter to number max
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessCb003', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessCb003 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let brightness = Number.MAX_VALUE;
      try {
        wnd.setWindowBrightness(brightness, (err) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback3. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('windowTest setBrightnessTest3CallBack setBrightness(Number.MAX_VALUE) success ');
            try {
              expect().assertFail();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the brightnesscall3CallBack. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_CB_004
     * @tc.name      : testSetWindowBrightnessCb004
     * @tc.desc      : Set the brightness bar input parameter to number min
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessCb004', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessCb004 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowBrightness(Number.MIN_VALUE, (err) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback4. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('windowTest setBrightnessTest4CallBack setBrightness(Number.MAX_VALUE) success ');
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the brightnesscall4CallBack. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    : TEST_SETWINDOWBRIGHTNESS_CB_005
     * @tc.name      : testSetWindowBrightnessCb005
     * @tc.desc      : Setting brightness bar input parameter exception
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowBrightnessCb005', 0, async function (done) {
      console.info('windowTest testSetWindowBrightnessCb005 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowBrightness(1.1, (err) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback5. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('windowTest setBrightnessTest5CallBack setBrightness(Number.MAX_VALUE) success ');
            try {
              expect().assertFail();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the brightnesscall5CallBack. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number    : TEST_SETWINDOWKEEPSCREENON_PROMISE_001
     * @tc.name      : testSetWindowKeepScreenOnPromise001
     * @tc.desc      : Set whether the window screenOn
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowKeepScreenOnPromise001', 0, async function (done) {
      console.info('windowTest testSetWindowKeepScreenOnPromise001 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowKeepScreenOn(true).then(() => {
        console.info('windowTest setKeepScreenOnTest1 setKeepScreenOn(false) success ');
        let data2 = wnd.getWindowProperties();
        expect(data2.isKeepScreenOn).assertTrue();
        done();
      }, (err) => {
        console.info('windowTest setKeepScreenOnTest1 setKeepScreenOn failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number    : TEST_SETWINDOWKEEPSCREENON_PROMISE_002
     * @tc.name      : testSetWindowKeepScreenOnPromise002
     * @tc.desc      : Set whether the window screenOn
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowKeepScreenOnPromise002', 0, async function (done) {
      console.info('windowTest testSetWindowKeepScreenOnPromise002 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowKeepScreenOn(false).then(() => {
        console.info('windowTest setKeepScreenOnTest2 setKeepScreenOn(false) success ');
        let data2 = wnd.getWindowProperties();
        expect(!data2.isKeepScreenOn).assertTrue();
        done();
      }, (err) => {
        console.info('windowTest setKeepScreenOnTest2 setKeepScreenOn failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })
    /**
     * @tc.number    : TEST_SETWINDOWKEEPSCREENON_CB_001
     * @tc.name      : testSetWindowKeepScreenOnCb001
     * @tc.desc      : Set whether the window screenOn
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowKeepScreenOnCb001', 0, async function (done) {
      console.info('windowTest testSetWindowKeepScreenOnCb001 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      wnd.setWindowKeepScreenOn(true, (err, data) => {
        if (err.code) {
          console.error('Failed to set the screen to be always on. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`wnd.setWindowKeepScreenOn catch error: ${JSON.stringify(error)}`)
          }
          done();
        } else {
          console.info('success set the screen to be always on. Cause: ' + JSON.stringify(data));
          let data2 = wnd.getWindowProperties();
          try {
            expect(data2.isKeepScreenOn).assertTrue();
          } catch (error) {
            console.info(`wnd.setWindowKeepScreenOn catch error: ${JSON.stringify(error)}`)
          }
          done();
        }
      })
    })
    /**
     * @tc.number    : TEST_SETWINDOWKEEPSCREENON_CB_002
     * @tc.name      : testSetWindowKeepScreenOnCb002
     * @tc.desc      : Set whether the window screenOn
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testSetWindowKeepScreenOnCb002', 0, async function (done) {
      console.info('windowTest testSetWindowKeepScreenOnCb002 begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      wnd.setWindowKeepScreenOn(false, (err, data) => {
        if (err.code) {
          console.error('Failed to set the screen to be always on. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`wnd.setWindowKeepScreenOn catch error: ${JSON.stringify(error)}`)
          }
          done();
        } else {
          console.info('success set the screen to be always on. Cause: ' + JSON.stringify(data));
          let data2 = wnd.getWindowProperties();
          try {
            expect(!data2.isKeepScreenOn).assertTrue();
          } catch (error) {
            console.info(`wnd.setWindowKeepScreenOn catch error: ${JSON.stringify(error)}`)
          }
          done();
        }
      })
    })
  })
}
