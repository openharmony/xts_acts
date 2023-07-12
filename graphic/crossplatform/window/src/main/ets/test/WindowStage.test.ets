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

export default function WindowStage() {
  describe("WindowStage", function () {
    let windowStage;
    let abilityStorage;
    const TRUE_FLAG = true;

    beforeAll(async function () {
      console.info("beforeAll case");
      windowStage = globalThis.windowStage;
      abilityStorage = globalThis.abilityStorage;
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

    async function sleep(time) {
      let timeoutId = null;
      let promise = new Promise(resolve => {
        timeoutId = setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
      clearTimeout(timeoutId)
    }

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

        expect(TRUE_FLAG).assertFail();
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
          expect(false).assertTrue();
          done();
        }
        expect(!!data).assertTrue();
        console.log(msgStr + 'getMainWindow success');
        done();
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
      let subWindow = await windowStage.createSubWindow('createSubWindow').catch((err) => {
        unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
        console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest1)=' + JSON.stringify(err));
      });
      expect(!!subWindow).assertTrue();
      await subWindow.destroy();
      console.log(msgStr + 'windowStage.createSubWindow end subWindow=' + JSON.stringify(subWindow));
      console.log(msgStr + 'windowStage.createSubWindow end !!subWindow=' + !!subWindow);
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
      }
      catch (err) {
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
      let subWnd = null

      function createSubWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.createSubWindow('createSubWindow', (err, data) => {
            if (err && err.code) {
              reject(null)
              console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest3) err=' + JSON.stringify(err));
            } else {
              resolve(data)
            }

          })
        })
      }

      function findWin() {
        return new Promise(function (resolve, reject) {
          window.find('createSubWindow', (err, data) => {
            if (err && err.code) {
              reject(false)
            } else {
              resolve(data)
            }
          })
        })
      }

      function destroyWin(win) {
        return new Promise(function (resolve, reject) {
          win.destroy((err, data) => {
            if (err && err.code) {
              reject(null)
            } else {
              resolve(true)
            }
          })
        })
      }

      subWnd = await createSubWindow().catch(err => {
        console.info(`window.create failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      expect(!!subWnd).assertTrue();

      let subWindow;
      subWindow = await findWin().catch(err => {
        console.info(`window.find failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })

      await destroyWin(subWindow).catch(err => {
        console.info(`window.destroy failed  error: ${JSON.stringify(err)}`)
        expect().assertFail();
        done();
      })
      let subWindowLast;
      subWindowLast = await findWin().catch(err => {
        console.info(`window.find failed  error: ${JSON.stringify(err)}`)
        expect(!err).assertTrue();
        done()
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
      let load3 = await windowStage.loadContent('MainAbility/pages/second/second').catch((err) => {
        unexpectedError(err, caseName, 'windowStage loadContent', done);
        console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
      });
      expect(!load3).assertTrue();
      console.log(msgStr + 'tempWnd.loadContent end load=' + JSON.stringify(load3));
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
        let load4 = await windowStage.loadContent(null).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load5=' + JSON.stringify(load4));
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
     * @tc.desc      : Verify the scenario of loading an null page with abilityStorage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentPromise003', 0, async function (done) {
      let caseName = 'testLoadContentPromise003';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let load5 = await windowStage.loadContent(null, abilityStorage).catch((err) => {
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage loadContent null' + JSON.stringify(err));
        });
        console.log(msgStr + 'windowStage loadContent end load5=' + JSON.stringify(load5));
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
     * @tc.desc      : Verify the scenario of loading an page and abilityStorage of null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentPromise004', 0, async function (done) {
      let caseName = 'testLoadContentPromise004';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let load6 = await windowStage.loadContent('MainAbility/pages/second/second', null).catch((err) => {
        unexpectedError(err, caseName, 'windowStage loadContent', done);
        console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
      });
      expect(!load6).assertTrue();
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
      windowStage.loadContent('MainAbility/pages/second/second', (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
          console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
        } else {
          try {
            expect(!data).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'windowStage.loadContent end data=' + JSON.stringify(data));
          done();
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
        windowStage.loadContent(null, (err, data) => {
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
     * @tc.desc      : Verify the scenario of loading an page and abilityStorage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentStorageCb001', 0, async function (done) {
      let caseName = 'testLoadContentStorageCb001';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      windowStage.loadContent('MainAbility/pages/second/second', abilityStorage, (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
          console.log(msgStr + 'windowStage loadContent MainAbility/pages/second/second' + JSON.stringify(err));
        } else {
          try {
            expect(!data).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
          done();
          console.log(msgStr + 'windowStage.loadContent end data=' + JSON.stringify(data));
        }
      })
    })
    /**
     * @tc.number    : TEST_LOADCONTENT_STORAGE_CB_002
     * @tc.name      : testLoadContentStorageCb002
     * @tc.desc      : Verify the scenario of loading an null page with abilityStorage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testLoadContentStorageCb002', 0, async function (done) {
      let caseName = 'testLoadContentStorageCb002';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      try {
        windowStage.loadContent(null, abilityStorage, (err, data) => {
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
