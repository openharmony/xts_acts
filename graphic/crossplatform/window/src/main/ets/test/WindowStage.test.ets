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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function WindowStage() {
  describe("WindowStage", function () {
    let windowStage;
    let storage;
    const TRUE_FLAG = true;

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time))
    }

    beforeAll(async function () {
      console.info("beforeAll case");
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
        expect(TRUE_FLAG).assertTrue();
        expect(error.code === code).assertTrue();
      } catch (error) {
        console.info(`window.on ${JSON.stringify(error)}`)
      }
      done();
    }

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {
        expect().assertFail();
      } catch (error) {
        console.info(`unexpectedError catch error: ${JSON.stringify(error)}`)
      }
      done();
    }

    /**
     * @tc.number    : TEST_GETMAINWINDOW_PROMISE_001
     * @tc.name      : testGetMainWindowPromise001
     * @tc.desc      : Verify the scenario of getMainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetMainWindowPromise001', 0, async function (done) {
      let caseName = 'testGetMainWindowPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      expect(!!mainWin).assertTrue();
      console.log(msgStr + 'getMainWindow success');
      done();
    })
    /**
     * @tc.number    : TEST_GETMAINWINDOW_CB_001
     * @tc.name      : testGetMainWindowCb001
     * @tc.desc      : Verify the scenario of getMainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetMainWindowCb001', 0, async function (done) {
      let caseName = 'testGetMainWindowCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      windowStage.getMainWindow((err, data) => {
        if (err.code) {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
          return;
        }
        try {
          expect(!!data).assertTrue();
          console.log(msgStr + 'getMainWindow success');
          done();
        } catch (err) {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
        }
      })
    })
    /**
     * @tc.number    : TEST_GETMAINWINDOWSYNC_001
     * @tc.name      : testGetMainWindowSync001
     * @tc.desc      : Verify the scenario of getMainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetMainWindowSync001', 0, async function (done) {
      let caseName = 'testGetMainWindowSync001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let mainWin = windowStage.getMainWindowSync();
        expect(!!mainWin).assertTrue();
        console.log(msgStr + 'getMainWindow success');
        done();
      } catch (error) {
        console.log(msgStr + 'getMainWindow fail');
        done();
      }
    })

    /**
     * @tc.number    : TEST_CREATESUBWINDOW_PROMISE_001
     * @tc.name      : testCreateSubWindowPromise001
     * @tc.desc      : Verify the scenario of creating an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCreateSubWindowPromise001', 0, async function (done) {
      let caseName = 'testCreateSubWindowPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = await windowStage.createSubWindow('testCreateSubWindowPromise001').catch((err) => {
        unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
        console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest1)=' + JSON.stringify(err));
      });
      expect(!!subWindow).assertTrue();
      console.log(msgStr + 'windowStage.createSubWindow end subWindow=' + JSON.stringify(subWindow));
      console.log(msgStr + 'windowStage.createSubWindow end !!subWindow=' + !!subWindow);
      await subWindow.destroyWindow();
      done();
    })
    /**
     * @tc.number    : TEST_CREATESUBWINDOW_PROMISE_002
     * @tc.name      : testCreateSubWindowPromise002
     * @tc.desc      : Verify the scene of entering illegal values to create an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCreateSubWindowPromise002', 0, async function (done) {
      let caseName = 'testCreateSubWindowPromise002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let subWindow = await windowStage.createSubWindow(null).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage.createSubWindow(null) err=' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage.createSubWindow end subWindow=' + JSON.stringify(subWindow));
      } catch (err) {
        expectedError(err, caseName, 'windowStage.createSubWindow', done, 401);
        console.log(msgStr + 'windowStage.createSubWindow catch err=' + JSON.stringify(err));
      }
      done();
    })
    /**
     * @tc.number    : TEST_CREATESUBWINDOW_CB_001
     * @tc.name      : testCreateSubWindowCb001
     * @tc.desc      : Verify the scenario of creating an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCreateSubWindowCb001', 0, async function (done) {
      let caseName = 'testCreateSubWindowCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      windowStage.createSubWindow('testCreateSubWindowCb001', async (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
        } else {
          try {
            expect(!!data).assertTrue();
            console.log(msgStr + ' success');
            done();
          } catch (err) {
            unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
          }
        }
      })
    })
    /**
     * @tc.number    : TEST_CREATESUBWINDOW_CB_002
     * @tc.name      : testCreateSubWindowCb002
     * @tc.desc      : Verify the scene of entering illegal values to create an auxiliary window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCreateSubWindowCb002', 0, async function (done) {
      let caseName = 'testCreateSubWindowCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.createSubWindow(null, (err, data) => {
          console.log(msgStr + 'windowStage.createSubWindow(null) err=' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.createSubWindow catch error: ${JSON.stringify(error)}`)
          }
          done();
        });
      } catch (err) {
        try {
          expect(err.code === 401).assertTrue();
        } catch (error) {
          console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
        }
        done();
        console.log(msgStr + 'windowStage.createSubWindow(null) catch err=' + JSON.stringify(err));
      }
    })

    /**
     * @tc.number    : TEST_GETSUBWINDOW_PROMISE_001
     * @tc.name      : testGetSubWindowPromise001
     * @tc.desc      : Verify the scene of obtaining all auxiliary sub windows
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetSubWindowPromise001', 0, async function (done) {
      let caseName = 'testGetSubWindowPromise001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let subWindow = await windowStage.getSubWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getSubWindow', done);
        console.log(msgStr + 'windowStage.getSubWindow(null) err=' + JSON.stringify(err));
      });
      expect(!!subWindow).assertTrue();
      console.log(msgStr + 'windowStage.getSubWindow end subWindow=' + JSON.stringify(subWindow));
      done();
    })
    /**
     * @tc.number    : TEST_GETSUBWINDOW_CB_001
     * @tc.name      : testGetSubWindowCb001
     * @tc.desc      : Verify the scene of obtaining all auxiliary sub windows
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testGetSubWindowCb001', 0, async function (done) {
      let caseName = 'testGetSubWindowCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      windowStage.getSubWindow((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.getSubWindow', done);
          console.log(msgStr + 'windowStage.getSubWindow(null) err=' + JSON.stringify(err));
        } else {
          try {
            expect(!!data).assertTrue();
          } catch (error) {
            console.info(`windowStage.getSubWindow catch error: ${JSON.stringify(error)}`)
          }
          done();
          console.log(msgStr + 'windowStage.getSubWindow end data=' + JSON.stringify(data));
        }
      })
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
      console.log(msgStr + 'begin');
      await sleep(500);
      await windowStage.loadContent('TestAbility/pages/Index1').then(async () => {
        expect(true).assertTrue();
        await sleep(500);
        await windowStage.loadContent('TestAbility/pages/Index')
        await sleep(500);
        console.log(msgStr + 'tempWnd.loadContent success');
        done();
      }).catch((err) => {
        unexpectedError(err, caseName, 'windowStage loadContent', done);
      });
      done();
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_PROMISE_002
     * @tc.name      : testLoadContentPromise002
     * @tc.desc      : Verify the scenario of loading an null page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentPromise002', 0, async function (done) {
      let caseName = 'testLoadContentPromise002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let load = await windowStage.loadContent(null).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load=' + JSON.stringify(load));
      }
      catch (err) {
        console.log(msgStr + 'windowStage loadContent catch err=' + JSON.stringify(err));
        expectedError(err, caseName, 'tempWnd.loadContent', done, 401);
      }
      done();
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_PROMISE_003
     * @tc.name      : testLoadContentPromise003
     * @tc.desc      : Verify the scenario of loading an null page with storage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentPromise003', 0, async function (done) {
      let caseName = 'testLoadContentPromise003';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let load = await windowStage.loadContent(null, storage).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load=' + JSON.stringify(load));
      }
      catch (err) {
        console.log(msgStr + 'windowStage loadContent catch err=' + JSON.stringify(err));
        expectedError(err, caseName, 'windowStage loadContent', done, 401);
      }
      done();
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_PROMISE_004
     * @tc.name      : testLoadContentPromise004
     * @tc.desc      : Verify the scenario of loading an page and storage of null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentPromise004', 0, async function (done) {
      let caseName = 'testLoadContentPromise004';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      await sleep(500);
      await windowStage.loadContent('TestAbility/pages/Index1', null).then(async () => {
        expect(true).assertTrue();
        await sleep(500);
        await windowStage.loadContent('TestAbility/pages/Index')
        await sleep(500);
        console.log(msgStr + 'tempWnd.loadContent success');
        done();
      }).catch((err) => {
        unexpectedError(err, caseName, 'windowStage loadContent', done);
      });
      done();
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
      console.log(msgStr + 'begin');
      await sleep(500);
      windowStage.loadContent('TestAbility/pages/Index1', async (err) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
        } else {
          try {
            expect(true).assertTrue();
            await sleep(500);
            await windowStage.loadContent('TestAbility/pages/Index')
            await sleep(500);
            console.log(msgStr + 'tempWnd.loadContent success');
            done();
          } catch (err) {
            unexpectedError(err, caseName, 'windowStage.loadContent', done);
          }
        }
      })
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_CB_002
     * @tc.name      : testLoadContentCb002
     * @tc.desc      : Verify the scenario of loading an null page
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentCb002', 0, async function (done) {
      let caseName = 'testLoadContentCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      try {
        windowStage.loadContent(null, (err) => {
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          done();
        });
      } catch (err) {
        console.log(msgStr + 'windowStage loadContent null catch err' + JSON.stringify(err));
        try {
          expect(err.code == 401).assertTrue();
        } catch (error) {
          console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
        }
        done();
      }
      console.log(msgStr + 'end');
    })

    /**
     * @tc.number    : TEST_LOADCONTENT_STORAGE_CB_001
     * @tc.name      : testLoadContentStorageCb001
     * @tc.desc      : Verify the scenario of loading an page and storage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentStorageCb001', 0, async function (done) {
      let caseName = 'testLoadContentStorageCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      windowStage.loadContent('TestAbility/pages/Index1', storage, async (err) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
        } else {
          try {
            expect(true).assertTrue();
            await sleep(500);
            await windowStage.loadContent('TestAbility/pages/Index')
            await sleep(500);
            console.log(msgStr + 'tempWnd.loadContent success');
            done();
          } catch (err) {
            unexpectedError(err, caseName, 'windowStage.loadContent', done);
          }
        }
      })
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_STORAGE_CB_002
     * @tc.name      : testLoadContentStorageCb002
     * @tc.desc      : Verify the scenario of loading an null page with storage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentStorageCb002', 0, async function (done) {
      let caseName = 'testLoadContentStorageCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      try {
        windowStage.loadContent(null, storage, (err) => {
          console.log(msgStr + 'windowStage loadContent null ' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          done();
        });
      } catch (err) {
        console.log(msgStr + 'windowStage loadContent null catch err ' + JSON.stringify(err));
        try {
          expect(err.code === 401).assertTrue();
        } catch (error) {
          console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
        }
        done();
      }
    })
  })
}
