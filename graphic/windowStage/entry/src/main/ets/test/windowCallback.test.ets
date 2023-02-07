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
import display from '@ohos.display';
import screenManager from '@ohos.screen';

export default function windowCallbackTest(context, windowStage, abilityStorage) {
  console.log('testets context: ' + JSON.stringify(context))
  console.log('testets context windowStage: ' + JSON.stringify(windowStage));
  console.log('testets context abilityStorage: ' + JSON.stringify(abilityStorage));

  describe('windowCallback_test', function () {
    console.log('describe testets start!!')
    const TRUE_FLAG = true;
    console.log('describe window_api_test start!!!');
    var commonRGBColorArr = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)', 'rgb(102,102,102)', 'rgb(255,247,0)'];
    var commonNUMBERColorArr = ['#00FF0000', '#0000FF00', '#000000FF', '#00FFFFFF', '#00000000', '#00F900E6', '#00666666', '#00FFF700'];
    var commonKEYColorArr = ['red', 'green', 'blue', 'white', 'black', 'pink', 'grey', 'yellow'];
    var appWindowTypeArr = [];
    var windowTypeArr = [];
    var appWindowTypeDic = {
      'TYPE_BASE': 0,
      'TYPE_APP': 0,
      'TYPE_APP_SUB_WINDOW': 1,
    };
    var systemWindowTypeArr = [];
    var systemWindowTypeDic = {
      'TYPE_SYSTEM_ALERT': 1,
      'TYPE_INPUT_METHOD': 2,
      'TYPE_STATUS_BAR': 3,
      'TYPE_PANEL': 4,
      'TYPE_KEYGUARD': 5,
      'TYPE_VOLUME_OVERLAY': 6,
      'TYPE_NAVIGATION_BAR': 7,
      'TYPE_FLOAT': 8,
      'TYPE_FLOAT_CAMERA': 9
    }
    var windowLayoutModeArr = [];
    var windowLayoutModeDic = {
      'WINDOW_LAYOUT_MODE_TILE': 1,
      'WINDOW_LAYOUT_MODE_CASCADE': 0
    };
    var windowCount = 2022;
    var listenerStatus = {
      ready: 'ready',
      pending: 'pending',
      finished: 'finished'
    };
    var listenerData = {
      on: false,
      typeStr: '',
    };
    var newWindowObj = null;
    beforeAll(function () {
      appWindowTypeArr = Object.keys(appWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      for (var i in ohosWindow.WindowType) {
        windowTypeArr.push(ohosWindow.WindowType[i]);
      }
      console.log('jsunittest beforeall');
      console.log('beforeall ohosWindow.windowType' + JSON.stringify(ohosWindow.WindowType))
    })
    beforeEach(function () {
    })
    afterEach(async function (done) {
      windowCount++;
      console.log('jsunittest afterEach listenerData:' + JSON.stringify(listenerData));
      if (listenerData.on) {
        listenerData.on = false;
        if (listenerData.typeStr === 'systemBarTintChange') {
          console.log('jsunittest systemBarTintChange start on');
          console.log('jsunittest systemBarTintChange end off listenerData.typeStr==' + JSON.stringify(listenerData.typeStr));
          ohosWindow.off(listenerData.typeStr);
          console.log('jsunittest systemBarTintChange end off');
        } else if (newWindowObj) {
          newWindowObj.off(listenerData.typeStr);
          console.log('jsunittest newWindowObj listenerData.typeStr:' + JSON.stringify(listenerData.typeStr));
        }
        await sleep(3000);
      }
      done();
    })
    afterAll(function () {
    })

    function expectedError(error, caseName, apiName, done, code) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {
        expect(TRUE_FLAG).assertTrue();
        expect(error.code === code).assertTrue();
      } catch (error) {
        console.info(`ohosWindow.on ${JSON.stringify(error)}`)
      }
      done();
    }

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      try {
        expect(TRUE_FLAG).assertFail();
      } catch (error) {
        console.info(`ohosWindow.on ${JSON.stringify(error)}`)
      }
      done();
    }

    function sleep(time) {
      return new Promise(resolve => {
        setTimeout(() => {
          resolve('sleep finished');
        }, time);
      })
    }
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_006
     * @tc.name       Test setSystemBarEnableTest6
     * @tc.desc       Verify that the scene shows the status bar and hides the navigation bar
     */
    it('setSystemBarEnableTest6', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let flagStatus = false;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';

      function ohosWindowOn() {
        ohosWindow.on('systemBarTintChange', systembartintstate => {
          console.log(msgStr + 'ohosWindow.on  systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
          console.log(msgStr + 'ohosWindow.on  flagStatus : ' + JSON.stringify(flagStatus));
          if (flagStatus) {
            try {
              expect(!!systembartintstate).assertTrue();
              expect(!!systembartintstate.regionTint).assertTrue();
            } catch (error) {
              console.info(msgStr + `ohosWindow.on ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'flagStatus || flagNav' + msgStr + 'ohosWindow.on systemBarTintChange regionTint:' + JSON.stringify(systembartintstate.regionTint));
            done();
          }
        })
      }

      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');
      console.log(msgStr + 'windowStage = ' + JSON.stringify(windowStage));

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            console.log(msgStr + 'getMainWindow data2' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
            }
            try {
              mainWnd = data;
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(msgStr + `getMainWindow ${JSON.stringify(error)}`)
            }
            resolve(data);
            console.log(msgStr + 'await windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err, data) => {
            console.log(msgStr + 'mainWnd.show err' + JSON.stringify(err));
            console.log(msgStr + 'mainWnd.show data' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.show', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (err) {
              console.info(msgStr + `mainWnd.show err: ${JSON.stringify(err)}`)
            }
            console.log(msgStr + 'mainWnd.show success');
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen data:' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setFullScreen true', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(msgStr + `setFullScreen ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'mainWnd.setFullScreen success');
            resolve(data)
          })
        })
      }

      function setSystemBarEnableStatus() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['status'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(data)===' + JSON.stringify(data));
            if (err && err.code) {
              console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(err)===' + JSON.stringify(err));
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [status]', done);
            }
            try {
              flagStatus = true
              expect(!data).assertTrue();
            } catch (error) {
              console.info(msgStr + `setSystemBarEnable ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      await setSystemBarEnableStatus()
      ohosWindowOn()
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_007
     * @tc.name       Test setSystemBarEnableTest7
     * @tc.desc       Verify that the scene hides the status bar and displays the navigation bar.
     */
    it('setSystemBarEnableTest7', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';

      function ohosWindowOn() {
        ohosWindow.on('systemBarTintChange', systembartintstate => {
          console.log(msgStr + 'ohosWindow.on systembartintstate ：' + JSON.stringify(systembartintstate));
          console.log(msgStr + 'ohosWindow.on systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
          if (flagStatus || flagNav) {
            console.log(msgStr + 'ohosWindow.on flagStatus || flagNav：');
            try {
              expect(!!systembartintstate).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on catch err: ${JSON.stringify(error)}`)
            }
            done();
          }
        })
      }

      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null')

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            console.log(msgStr + 'getMainWindow data2' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
            }
            try {
              mainWnd = data;
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on ${JSON.stringify(error)}`)
            }
            resolve(data);
            console.log(msgStr + 'await windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.show', done);
            }
            console.log(msgStr + 'mainWnd.show success');
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.show catch error: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setFullScreen true', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setFullScreen catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setSystemBarEnableStatus() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['status'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(data)==' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [status]', done);
            }
            flagStatus = true;
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setSystemBarEnable catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setSystemBarEnableNavigation() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['navigation'], (err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [navitgation]', done);
            }
            flagNav = true;
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setSystemBarEnable catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      ohosWindowOn()
      await setSystemBarEnableStatus()
      await setSystemBarEnableNavigation()
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_008
     * @tc.name       Test setSystemBarEnableTest8
     * @tc.desc       Verify that the scene displays both the status bar and the navigation bar.
     */
    it('setSystemBarEnableTest8', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
            }
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.getMainWindow catch err: ${JSON.stringify(error)}`)
            }
            mainWnd = data;
            console.log(msgStr + 'await windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
            resolve(data)
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.show', done);
            }
            console.log(msgStr + 'mainWnd.show success');
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.show catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setFullScreen true', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setFullScreen catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setSystemBarEnable() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable([], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable [] JSON.stringify(data)==' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable []', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setSystemBarEnable catch err: ${JSON.stringify(error)}`)
            }
            listenerData.on = true;
            listenerData.typeStr = 'systemBarTintChange';
            resolve(data)
          })
        })
      }

      function ohosWindowOn() {
        ohosWindow.on('systemBarTintChange', systembartintstate => {
          console.log(msgStr + 'ohosWindow.on systemBarTintChange ：' + JSON.stringify(systembartintstate));
          console.log(msgStr + 'ohosWindow.on systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
          if (flagStatus || flagNav) {
            let enable = systembartintstate.regionTint[0].isEnable
            let numType = systembartintstate.regionTint[0].type
            let enableNav = systembartintstate.regionTint[1].isEnable
            let numTypeNav = systembartintstate.regionTint[1].type
            console.log(msgStr + 'ohosWindow.on isEnable : ' + JSON.stringify(enable));
            console.log(msgStr + 'ohosWindow.on numType : ' + JSON.stringify(numType));
            try {
              expect(numType === ohosWindow.WindowType.TYPE_STATUS_BAR || enable).assertTrue();
              expect(numTypeNav === ohosWindow.WindowType.TYPE_NAVIGATION_BAR || enableNav).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on catch err: ${JSON.stringify(error)}`)
            }
          }
          done();
        })
      }

      function setSystemBarEnableT() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [status,navigation]', done);
            }
            flagStatus = true;
            flagNav = true;
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setSystemBarEnable catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      await setSystemBarEnable()
      await setSystemBarEnableT()
      ohosWindowOn()
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_009
     * @tc.name       Test setSystemBarEnableTest9
     * @tc.desc       Verify that the scene hides both the status bar and the navigation bar.
     */
    it('setSystemBarEnableTest9', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
            }
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`windowStage.getMainWindow catch err: ${JSON.stringify(error)}`)
            }
            mainWnd = data;
            console.log(msgStr + 'await windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
            resolve(data)
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.show', done);
            }
            console.log(msgStr + 'mainWnd.show success');
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.show catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setFullScreen', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setFullScreen catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setSystemBarEnableT() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable status,navigation JSON.stringify(data)==' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [status,navigation]', done);
            }
            flagStatus = true;
            flagNav = true;
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setSystemBarEnable catch err: ${JSON.stringify(error)}`)
            }
            listenerData.on = true;
            listenerData.typeStr = 'systemBarTintChange';
            resolve(data)
          })
        })
      }

      function ohosWindowOn() {
        ohosWindow.on('systemBarTintChange', (systembartintstate) => {
          console.log(msgStr + 'ohosWindow.on systemBarTintChange ：' + JSON.stringify(systembartintstate));
          console.log(msgStr + 'ohosWindow.on systemBarTintChange systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
          if (flagStatus || flagNav) {
            try {
              expect(!!systembartintstate).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on catch err: ${JSON.stringify(error)}`)
            }
            done();
          }
        })
      }

      function setSystemBarEnable() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable([], (err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable []', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setSystemBarEnable catch err: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      await setSystemBarEnableT()
      ohosWindowOn()
      await setSystemBarEnable()
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_010
     * @tc.name       Test setSystemBarEnableTest10
     * @tc.desc       Verify the scene where illegal values are entered when the navigation bar and status bar are displayed or hidden
     */
    it('setSystemBarEnableTest10', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest10';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
            }
            try {
              console.log(msgStr + 'windowStage.getMainWindow  JSON.stringify(!!data)===' + JSON.stringify(!!data));
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`windowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
            }
            mainWnd = data;
            console.log(msgStr + 'await windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
            resolve(data)
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          mainWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.show', done);
            }
            console.log(msgStr + 'mainWnd.show success');
            try {
              console.log(msgStr + 'mainWnd.show  JSON.stringify(!data)===' + JSON.stringify(!data));
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.show catch error: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen: ' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setFullScreen true', done);
            }
            try {
              console.log(msgStr + 'mainWnd.setFullScreen  JSON.stringify(!data)===' + JSON.stringify(!data));
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setFullScreen catch error: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setSystemBarEnable() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable([], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable [] JSON.stringify(data)==' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable []', done);
            }
            try {
              console.log(msgStr + 'mainWnd.setSystemBarEnable  JSON.stringify(!data)===' + JSON.stringify(!data));
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`mainWnd.setSystemBarEnable catch error: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function setSystemBarEnableError() {
        return new Promise(function (resolve, reject) {
          mainWnd.setSystemBarEnable([null, '123'], (err, data) => {
            console.log(msgStr + 'mainWnd.setSystemBarEnable [null,123] JSON.stringify(data)==' + JSON.stringify(data));
            console.log(msgStr + 'mainWnd.setSystemBarEnable [null,123] JSON.stringify(err)==' + JSON.stringify(err));
            if (err && err.code) {
              try {
                console.log(msgStr + 'mainWnd.setSystemBarEnable  JSON.stringify(err.code)===' + JSON.stringify(err.code));
                expect(err.code === 1003).assertTrue();
              } catch (error) {
                console.info(`mainWnd.setSystemBarEnable catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [null,123]', done);
            }
            resolve(data)
          })
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      await setSystemBarEnable()
      await setSystemBarEnableError()
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_004
     * @tc.name       Test setSystemBarPropertiesTest1
     * @tc.desc       TVerify the scene where the colors of the status bar and navigation bar are set in RGB
     */
    it('setSystemBarPropertiesTest4', 0, async done => {
      let caseName = 'setSystemBarPropertiesTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonRGBColorArr));
      let compareCount = 0;
      let listenerFlag = false;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';

      function ohosWindowOn() {
        ohosWindow.on('systemBarTintChange', (systemBarData) => {
          console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
          if (listenerFlag) {
            try {
              expect(!!systemBarData).assertTrue();
              expect(!!systemBarData.regionTint).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
            }
            let arrLength = systemBarData.regionTint.length;
            for (let i = 0; i < arrLength; i++) {
              let tempData = systemBarData.regionTint[i];
              if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR || tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
                console.log(msgStr + 'systemBarTintChange compare start!');
                compareCount++;
                let backgroundIndex = cloneColorArr.indexOf(tempData.backgroundColor);
                let contentColorIndex = cloneColorArr.indexOf(tempData.contentColor);
                try {
                  expect(backgroundIndex === -1).assertTrue();
                  expect(contentColorIndex === -1).assertTrue();
                } catch (error) {
                  console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
                }
              }
              if (i === arrLength - 1) {
                done();
              }
            }
          }
          console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
        })
      }

      let tempWnd = null

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
            }
            tempWnd = data
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`windowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
            resolve(data)
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          tempWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.show', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.show success');
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setFullScreen catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');
            resolve(data)
          })
        })
      }

      function setSystemBarEnableNavigationT() {
        return new Promise(function (resolve, reject) {
          tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setSystemBarEnable catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
            listenerFlag = true;
            resolve(data)
          })
        })
      }

      function setSystemBarProperties() {
        return new Promise(function (resolve, reject) {
          let loopCount = commonRGBColorArr.length
          for (let i = 0; i < loopCount; i++) {
            let tempColor = commonRGBColorArr[i];
            let systemBarProperties = {
              statusBarColor: tempColor,
              isStatusBarLightIcon: true,
              statusBarContentColor: tempColor,
              navigationBarColor: tempColor,
              isNavigationBarLightIcon: false,
              navigationBarContentColor: tempColor,
            };
            tempWnd.setSystemBarProperties(systemBarProperties, (err, data) => {
              console.log(msgStr + 'tempWnd.setSystemBarProperties err' + JSON.stringify(err));
              console.log(msgStr + 'tempWnd.setSystemBarProperties data' + JSON.stringify(data));
              if (err && err.code) {
                unexpectedError(err, caseName, 'tempWnd.setSystemBarProperties' + tempColor + ' ', done);
              }
              console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
              resolve(data)
            })
          }
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      ohosWindowOn()
      await setSystemBarEnableNavigationT()
      await setSystemBarProperties()
    })
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_005
     * @tc.name       Test setSystemBarPropertiesTest5
     * @tc.desc       Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     */
    it('setSystemBarPropertiesTest5', 0, async done => {
      let caseName = 'setSystemBarPropertiesTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = {
        SBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        SCC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NCC: JSON.parse(JSON.stringify(commonNUMBERColorArr))
      };
      let compareCount = 0;
      let endNum = 0;
      let listenerFlag = false;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';

      function ohosWindowOn() {
        ohosWindow.on('systemBarTintChange', (systemBarData) => {
          console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
          if (listenerFlag) {
            try {
              expect(!!systemBarData).assertTrue();
              expect(!!systemBarData.regionTint).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
            }
            let arrLength = systemBarData.regionTint.length;
            for (let i = 0; i < arrLength; i++) {
              console.log(msgStr + 'for arrLenght compareCount: ' + compareCount + ' ,i:' + i + '  ,arrLength:' + arrLength);
              let tempData = systemBarData.regionTint[i];
              if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR) {
                console.log(msgStr + 'systemBarTintChange compare start! arrLength= ' + arrLength);
                compareCount++;
                let backgroundIndex = cloneColorArr.SBC.indexOf(tempData.backgroundColor);
                let contentColorIndex = cloneColorArr.SCC.indexOf(tempData.contentColor);
                if (backgroundIndex >= 0) {
                  cloneColorArr.SBC.splice(backgroundIndex, 1);
                } else {
                  console.log(msgStr + 'SBC tempData.backgroundColor:' + JSON.stringify(tempData.backgroundColor));
                }
                if (contentColorIndex >= 0) {
                  cloneColorArr.SCC.splice(contentColorIndex, 1);
                } else {
                  console.log(msgStr + 'SCC tempData.contentColor:' + JSON.stringify(tempData.contentColor));
                }
                let ca = cloneColorArr;
                let flag = ca.NCC.length || ca.NBC.length || ca.SBC.length || ca.SCC.length
                if (compareCount === 18 && !flag) {
                  console.log(msgStr + 'if compareCount: ' + compareCount + ' ,true flag:' + flag);
                  try {
                    expect(true).assertTrue();
                  } catch (error) {
                    console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
                  }
                } else {
                  console.log(msgStr + 'compareCount: ' + compareCount + ' ,flag:' + flag);
                }
                console.log(msgStr + 'compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.SCC.length) + '   ,cloneColorArr.SBC:' + JSON.stringify(cloneColorArr.SBC));
                console.log(msgStr + 'compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.SCC.length) + '    ,cloneColorArr.SCC' + JSON.stringify(cloneColorArr.SCC));
                done();
              } else if (tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
                console.log(msgStr + 'systemBarTintChange compare start!');
                compareCount++;
                let backgroundIndex = cloneColorArr.NBC.indexOf(tempData.backgroundColor);
                let contentColorIndex = cloneColorArr.NCC.indexOf(tempData.contentColor);
                if (backgroundIndex >= 0) {
                  cloneColorArr.NBC.splice(backgroundIndex, 1);
                } else {
                  console.log(msgStr + 'NBC tempData.backgroundColor:' + JSON.stringify(tempData.backgroundColor));
                }
                if (contentColorIndex >= 0) {
                  cloneColorArr.NCC.splice(contentColorIndex, 1);
                } else {
                  console.log(msgStr + 'NCC tempData.contentColor:' + JSON.stringify(tempData.contentColor));
                }
                let ca = cloneColorArr;
                let flag = ca.NCC.length || ca.NBC.length || ca.SBC.length || ca.SCC.length
                if (compareCount === 18 && !flag) {
                  console.log(msgStr + 'else compareCount: ' + compareCount + ' ,true flag:' + flag);
                  try {
                    expect(true).assertTrue();
                  } catch (error) {
                    console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
                  }
                } else {
                  console.log(msgStr + 'compareCount: ' + compareCount + ' ,flag:' + flag);
                }
                console.log(msgStr + 'compareCount: ' + endNum + ' ,compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.NBC.length) + '   ,cloneColorArr.SBC:' + JSON.stringify(cloneColorArr.NBC));
                console.log(msgStr + 'compareCount: ' + endNum + ' ,compareCount: ' + compareCount + ' ,length: ' + JSON.stringify(cloneColorArr.NCC.length) + '    ,cloneColorArr.SCC' + JSON.stringify(cloneColorArr.NCC));
                endNum = compareCount
                done();
              }
            }
          }
          console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
        })
      }

      let tempWnd = null

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
            }
            tempWnd = data
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`windowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
            resolve(data)
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          tempWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.show', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.show success');
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setFullScreen catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');
            resolve(data)
          })
        })
      }

      function setSystemBarEnableNavigationT() {
        return new Promise(function (resolve, reject) {
          tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setSystemBatEnable catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
            listenerFlag = true;
            resolve(data)
          })
        })
      }

      function setSystemBarProperties() {
        return new Promise(function (resolve, reject) {
          let loopCount = commonNUMBERColorArr.length
          for (let i = 0; i < loopCount; i++) {
            console.log(msgStr + 'tempWnd.setSystemBarEnable i:' + i);
            let tempColor = commonNUMBERColorArr[i];
            let systemBarProperties = {
              statusBarColor: tempColor,
              isStatusBarLightIcon: true,
              statusBarContentColor: tempColor,
              navigationBarColor: tempColor,
              isNavigationBarLightIcon: true,
              navigationBarContentColor: tempColor,
            };
            tempWnd.setSystemBarProperties(systemBarProperties, (err, data) => {
              console.log(msgStr + 'tempWnd.setSystemBarProperties err' + JSON.stringify(err));
              console.log(msgStr + 'tempWnd.setSystemBarProperties data' + JSON.stringify(data));
              if (err && err.code) {
                try {
                  expect(TRUE_FLAG).assertFail();
                } catch (error) {
                  console.info(`tempWnd.setSystemBarProperties catch error: ${JSON.stringify(error)}`)
                }
              }
              resolve(data)
            })
          }
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      ohosWindowOn()
      await setSystemBarEnableNavigationT()
      await setSystemBarProperties()
    })
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_006
     * @tc.name       Test setSystemBarPropertiesTest6
     * @tc.desc       TVerify the scene where the status bar and navigation bar colors are set as keywords
     */
    it('setSystemBarPropertiesTest6', 0, async done => {
      let caseName = 'setSystemBarPropertiesTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonKEYColorArr));
      let compareCount = 0;
      let listenerFlag = false;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';

      function ohosWindowOn() {
        ohosWindow.on('systemBarTintChange', (systemBarData) => {
          console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
          if (listenerFlag) {
            try {
              expect(!!systemBarData).assertTrue();
              expect(!!systemBarData.regionTint).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
            }
            let arrLength = systemBarData.regionTint.length;
            for (let i = 0; i < arrLength; i++) {
              let tempData = systemBarData.regionTint[i];
              if (tempData.type === ohosWindow.WindowType.TYPE_STATUS_BAR || tempData.type === ohosWindow.WindowType.TYPE_NAVIGATION_BAR) {
                console.log(msgStr + 'systemBarTintChange compare start!');
                compareCount++;
                let backgroundIndex = cloneColorArr.indexOf(tempData.backgroundColor);
                let contentColorIndex = cloneColorArr.indexOf(tempData.contentColor);
                try {
                  expect(backgroundIndex === -1).assertTrue();
                  expect(contentColorIndex === -1).assertTrue();
                } catch (error) {
                  console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
                }
              }
            }
          }
          console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
        })
      }

      let tempWnd = null
      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
            }
            tempWnd = data
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`winsowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
            resolve(data)
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          tempWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.show', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.show success');
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setFullScreen catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');
            resolve(data)
          })
        })
      }

      function setSystemBarEnableNavigationT() {
        return new Promise(function (resolve, reject) {
          tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setSystemBarEnable catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
            listenerFlag = true;
            resolve(data)
          })
        })
      }

      function setSystemBarProperties() {
        return new Promise(function (resolve, reject) {
          let loopCount = commonRGBColorArr.length
          for (let i = 0; i < loopCount; i++) {
            let tempColor = commonKEYColorArr[i];
            let systemBarProperties = {
              statusBarColor: tempColor,
              isStatusBarLightIcon: true,
              statusBarContentColor: tempColor,
              navigationBarColor: tempColor,
              isNavigationBarLightIcon: false,
              navigationBarContentColor: tempColor,
            };
            tempWnd.setSystemBarProperties(systemBarProperties, (err, data) => {
              console.log(msgStr + 'tempWnd.setSystemBarProperties err' + JSON.stringify(err));
              console.log(msgStr + 'tempWnd.setSystemBarProperties data' + JSON.stringify(data));
              if (err && err.code) {
                try {
                  expect(TRUE_FLAG).assertFail();
                } catch (error) {
                  console.info(`tempWnd.setSystemBarProperties catch error: ${JSON.stringify(error)}`)
                }
                resolve(data)
                done();
              }
            })
          }
          listenerFlag = false;
          done();
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      ohosWindowOn()
      await setSystemBarEnableNavigationT()
      await setSystemBarProperties()
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_005
     * @tc.name       Test create5
     * @tc.desc       Scheme of Failed to Create Application Type Window in Stage Mode
     */
    it('createTest5', 0, async done => {
      let caseName = 'createTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let loopCount = appWindowTypeArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);
      for (let i = 0; i < loopCount; i++) {
        let tempType = ohosWindow.WindowType.TYPE_APP;
        let windId = 'createTest5' + i;
        console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
        ohosWindow.create(context, windId, tempType, (err, data) => {
          console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
          console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
          if (err && err.code) {
            try {
              expect(err.code === 1003).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
            }
            if (i === loopCount - 1) {
              done();
              console.log(msgStr + 'ohosWindow.create i==' + i)
              console.log(msgStr + 'ohosWindow.create loopCount - 1==' + (loopCount - 1))
            }
          } else {
            unexpectedError(err, caseName, 'ohosWindow.create ' + tempType, done);
          }
        })
      }
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_006
     * @tc.name       Test createTest6
     * @tc.desc       Verify the scenario of creating the system type window
     */
    it('createTest6', 0, async done => {
      let caseName = 'createTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);
      let tempWnd = null
      let tempType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;

      function create(i) {
        return new Promise(function (resolve, reject) {
          let windId = 'createTest6' + i;
          console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
          console.log(msgStr + 'ohosWindow.create windId： ' + windId + ' start');
          ohosWindow.create(context, windId, tempType, (err, data) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.create ' + tempType, done);
              return;
            }
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
            }
            tempWnd = data
            console.log(msgStr + 'ohosWindow.create ' + tempType + ' wnd: ' + tempWnd);
            resolve(i)
          })
        })
      }

      function getProperties(i) {
        return new Promise(function (resolve, reject) {
          tempWnd.getProperties((err, data) => {
            console.log(msgStr + 'tempWnd.getProperties err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.getProperties data' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.getProperties', done);
              console.log(msgStr + 'tempWnd.getProperties err&&err.code' + JSON.stringify(err));
              return;
            }
            console.log(msgStr + 'tempWnd.getProperties success, !!data : ' + !!data);
            try {
              expect(!!data).assertTrue();
              expect(data.type == tempType).assertTrue();
            } catch (error) {
              console.info(`tempWnd.getProperties catch error: ${JSON.stringify(error)}`)
            }
            resolve(i)
          })
        })
      }

      function find(i) {
        return new Promise(function (resolve, reject) {
          console.log(msgStr + 'ohosWindow.find createTest6' + i);
          ohosWindow.find('createTest6' + i, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(i)
          })
        })
      }

      function destroy(i) {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(i)
          })
        })
      }

      function findAgain(i) {
        return new Promise(function (resolve, reject) {
          console.log(msgStr + 'ohosWindow.findAgain createTest6' + i);
          ohosWindow.find('createTest6' + i, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              expect(true).assertTrue();
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
              try {
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(i)
            done();
          })
        })
      }

      for (let i = 0; i < loopCount; i++) {
        await create(i)
        await getProperties(i)
        await find(i)
        await destroy(i)
        await findAgain(i)
      }
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_007
     * @tc.name       Test createTest7
     * @tc.desc       Verify the scenario of creating a window of a type that does not exist
     */
    it('createTest7', 0, async done => {
      let caseName = 'createTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'createTest7';
      console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windId, tempType, (err, data) => {
            console.log(msgStr + 'ohosWindow.create  data' + JSON.stringify(data));
            if (err && err.code) {
              try {
                expect(err.code === 1003).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
              }
              done();
              return;
            }
            unexpectedError(err, caseName, 'ohosWindow.create', done);
            resolve(data)
          })
        })
      }

      await create()
    })

    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_008
     * @tc.name       Test createTest8
     * @tc.desc       Verify the scenario of creating a window with duplicate IDs
     */
    it('createTest8', 0, async done => {
      let caseName = 'createTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'sameid'
      let tempWnd = null;

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, 1, (err, data) => {
            console.log(msgStr + 'ohosWindow.create 1 once err: ' + JSON.stringify(err));
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.create', done);
            }
            expect(!!data).assertTrue();
            tempWnd = data;
            resolve(data)
          })
        })
      }

      function createAgain() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, 1, (err, data) => {
            console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
            if (err && err.code) {
              console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
              try {
                expect(err.code).assertEqual(1001)
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'ohosWindow.create', done);
              console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy(params) {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function findAgain(params) {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              expect(true).assertTrue();
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
              try {
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
            done();
          })
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return createAgain()
        }).then(function (params) {
          return find()
        }).then(function (params) {
          return destroy(params)
        }).then(function (params) {
          return findAgain(params)
        })
    })

    /**
     * @tc.number     SUB_WINDOW_ON_OFF_JSAPI_005
     * @tc.name       Test listenerTest5
     * @tc.desc       Verify whether the change of avoidance area and change monitoring can be turned on normally
     */
    it('listenerTest5', 0, async function (done) {
      let caseName = 'listenerTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let listenerOnFlag = false;
      console.log(msgStr + 'begin');
      let tempWnd = null;
      listenerData.on = true;
      listenerData.typeStr = 'systemAvoidAreaChange';

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            console.log(msgStr + 'windowStage.getMainWindow err: ' + JSON.stringify(err));
            console.log(msgStr + 'windowStage.getMainWindow data: ' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.show', done);
            }
            tempWnd = data
            newWindowObj = data
            console.log(msgStr + 'newWindowObj 1: ' + JSON.stringify(newWindowObj));
            console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`windowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function show() {
        return new Promise(function (resolve, reject) {
          tempWnd.show((err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.show', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.show success');
            resolve(data)
          })
        })
      }

      function setFullScreen() {
        return new Promise(function (resolve, reject) {
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setFullScreen catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');
            resolve(data)
          })
        })
      }

      function tempWndOn() {
        tempWnd.on('systemAvoidAreaChange', avoidAreaData => {
          console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, avoidAreaData : ' + JSON.stringify(avoidAreaData));
          if (listenerOnFlag === true) {
            listenerOnFlag = false;
            try {
              expect(!!avoidAreaData).assertTrue();
            } catch (error) {
              console.info(`tempWnd.on catch error: ${JSON.stringify(error)}`)
            }
          }
        })
      }

      function setSystemBarEnable() {
        return new Promise(function (resolve, reject) {
          tempWnd.setSystemBarEnable([], (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setSystemBarEnable catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
            listenerOnFlag = true;
            resolve(data)
          })
        })
      }

      function setSystemBarEnableT() {
        return new Promise(function (resolve, reject) {
          tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
            }
            console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
            console.log(msgStr + 'tempWnd.on systemAvoidAreaChange finished');
            resolve(data)
            tempWnd.off('systemAvoidAreaChange')
            done();
          })
        })
      }

      await getMainWindow()
      await show()
      await setFullScreen()
      tempWndOn()
      await setSystemBarEnable()
      await setSystemBarEnableT()
    })
    /**
     * @tc.number     SUB_WINDOW_SETWINDOWTYPE_JSAPI_003
     * @tc.name       Test setWindowTypeTest3
     * @tc.desc       Verify the scenario where the normal window type is set
     */
    it('setWindowTypeTest3', 0, async function (done) {
      let caseName = 'setWindowTypeTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'setWindowTypeTest3';
      console.log(msgStr + 'begin');
      console.log(msgStr + 'newWindowObj 2: ' + JSON.stringify(newWindowObj));
      let tempWnd = null
      let tempTypeArr = [];
      let loopCount1 = systemWindowTypeArr;
      console.log(msgStr + 'ohosWindow.windowType' + JSON.stringify(loopCount1))

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            try {
              console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
              console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
              console.log(msgStr + 'ohosWindow.create !!data' + !!data);
              if (!!data) {
                tempWnd = data
                console.log(msgStr + 'ohosWindow.create ' + baseWndType + ' wnd: ' + tempWnd);
                try {
                  expect(!!tempWnd).assertTrue();
                } catch (error) {
                  console.info(`ohosWindwo.create catch error: ${JSON.stringify(error)}`)
                }
              }
            } catch (err) {
              console.log(msgStr + 'ohosWindow.create catch err: ' + JSON.stringify(err));
            }
            resolve(0)
          })
        })
      }

      function setWindowType(tempType, i) {
        return new Promise(function (resolve, reject) {
          tempWnd.setWindowType(tempType, (err, data) => {
            console.log(msgStr + 'tempWnd.setWindowType i: ' + i);
            console.log(msgStr + 'tempWnd.setWindowType err: ' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.setWindowType data: ' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.setWindowType !data: ' + !data);
            if (!data) {
              expect(!data).assertTrue();
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            }
            console.log(msgStr + 'tempWnd.setWindowType ' + tempType + ' end');
            resolve(data)
          })
        })
      }

      function getProperties(tempType, i) {
        console.log(msgStr + 'getProperties start tempTypeArr:' + JSON.stringify(tempTypeArr) + ',i:' + i);
        return new Promise(function (resolve, reject) {
          tempWnd.getProperties((err, dataProper) => {
            console.log(msgStr + 'tempWnd.getProperties err: ' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.getProperties dataProper: ' + JSON.stringify(dataProper));
            console.log(msgStr + 'tempWnd.getProperties !!dataProper: ' + !!dataProper);
            expect(!!dataProper).assertTrue();
            expect(dataProper.type === tempType).assertTrue();
            resolve(dataProper)
          })
        })
      }

      await create()
      for (let i = 0; i < loopCount1.length; i++) {
        let tempType = ohosWindow.WindowType[loopCount1[i]];
        console.log(msgStr + 'tempWnd.setWindowType ：' + tempType + ' start');
        tempTypeArr.push(tempType);
        console.log(msgStr + 'for tempTypeArr:' + JSON.stringify(tempTypeArr) + ',i:' + i);
        await setWindowType(tempType, i)
        console.log(msgStr + 'getProperties start');
        await getProperties(tempType, i)
        if (i == loopCount1.length - 1) {
          console.log(msgStr + 'tempWnd.getProperties i=' + i + '   ,    loopCount1.length-1==' + loopCount1.length);
          tempWnd.destroy();
          done();
        }
      }
    })
    /**
     * @tc.number     SUB_WINDOW_SETWINDOWTYPE_JSAPI_004
     * @tc.name       Test setWindowTypeTest4
     * @tc.desc       Verify the scene of setting illegal window type
     */
    it('setWindowTypeTest4', 0, async function (done) {
      let caseName = 'setWindowTypeTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let changedWndType = null;
      let windowId = 'setWindowTypeTest4';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.create !!data' + !!data);
            if (!!data) {
              tempWnd = data
              try {
                expect(!!tempWnd).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
              }
              resolve(data)
            }
            else {
              unexpectedError(err, caseName, 'ohosWindow.create', done);
            }
          })
        })
      }

      function setWindowType() {
        return new Promise(function (resolve, reject) {
          tempWnd.setWindowType(changedWndType, (err, data) => {
            console.log(msgStr + 'tempWnd.setWindowType err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.setWindowType data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.setWindowType !!data' + !!data);
            if (!!data) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(err.code == 1003).assertTrue();
              } catch (error) {
                console.info(`tempWnd.setWindowType catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy(params) {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function findAgain(params) {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              try {
                expect(true).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            }
            resolve(data)
            done();
          })
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return setWindowType()
        }).then(function (params) {
          return find()
        }).then(function (params) {
          return destroy(params)
        }).then(function (params) {
          return findAgain(params)
        })
    })
    /**
     * @tc.number     SUB_WINDOW_DESTROY_JSAPI_002
     * @tc.name       Test destroyTest2
     * @tc.desc       Verification window destruction scenario
     */
    it('destroyTest2', 0, async function (done) {
      let caseName = 'destroyTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'destroyTest2';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.create !!data' + !!data);
            if (!!data) {
              tempWnd = data
              try {
                expect(!!tempWnd).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              resolve(data)
            } else {
              unexpectedError(err, caseName, 'ohosWindow.create', done);
            }
          })
        })
      }

      function destroy() {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              ohosWindow.find(windowId, (err, data) => {
                console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
                console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
                console.log(msgStr + 'ohosWindow.find !!data' + !!data);
                if (err && err.code) {
                  try {
                    expect(err.code == 1001).assertTrue();
                  } catch (error) {
                    console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
                  }
                  done();
                } else {
                  unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
                }
              })
            }
            resolve(data)
          })
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return destroy()
        })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_007
     * @tc.name       Test loadContentTest7
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest7', 0, async function (done) {
      let caseName = 'loadContentTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest7';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.create !!data' + !!data);
            if (!!data) {
              tempWnd = data
              try {
                expect(!!tempWnd).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'ohosWindow.create', done);
            }
            resolve(data)
          })
        })
      }

      function loadContent() {
        return new Promise(function (resolve, reject) {
          tempWnd.loadContent('pages/index', (err, data) => {
            console.log(msgStr + 'tempWnd.loadContent err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.loadContent data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.loadContent !data' + !data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.loadContent', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.loadContent catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy(params) {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function findAgain(params) {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              try {
                expect(true).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            }
            resolve(data)
            done();
          })
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return loadContent()
        }).then(function (params) {
          return find()
        }).then(function (params) {
          return destroy(params)
        }).then(function (params) {
          return findAgain(params)
        })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_008
     * @tc.name       Test loadContentTest8
     * @tc.desc       Verify the scenario of loading a page that does not exist
     */
    it('loadContentTest8', 0, async function (done) {
      let caseName = 'loadContentTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest8';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, windowId, baseWndType, (err, data) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.create !!data' + !!data);
            if (!!data) {
              tempWnd = data
              try {
                expect(!!tempWnd).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'ohosWindow.create', done);
            }
            resolve(data)
          })
        })
      }

      function loadContent() {
        return new Promise(function (resolve, reject) {
          tempWnd.loadContent(null, (err, data) => {
            console.log(msgStr + 'tempWnd.loadContent err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.loadContent data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.loadContent !!data' + !!data);
            if (err && err.code) {
              try {
                expect(err.code === 1003).assertTrue();
              } catch (error) {
                console.info(`tempWnd.loadContent catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'tempWnd.loadContent', done);
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy(params) {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function findAgain(params) {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(windowId, (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              try {
                expect(true).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            }
            resolve(data)
            done();
          })
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return loadContent()
        }).then(function (params) {
          return find()
        }).then(function (params) {
          return destroy(params)
        }).then(function (params) {
          return findAgain(params)
        })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_009
     * @tc.name       Test loadContentTest9
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest9', 0, async function (done) {
      let caseName = 'loadContentTest9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function loadContent() {
        return new Promise(function (resolve, reject) {
          windowStage.loadContent('pages/index/index.ets', (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'windowStage.loadContent', done);
              console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets)' + JSON.stringify(err));
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'windowStage.loadContent end data=' + JSON.stringify(data));
            }
            resolve(data)
            done();
          })
        })
      }

      await loadContent()
        .then(function (params) {
          console.log(msgStr + 'loadContent then: ' + JSON.stringify(params))
        })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_010
     * @tc.name       Test loadContentTest10
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest10', 0, async function (done) {
      let caseName = 'loadContentTest10';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function loadContent() {
        return new Promise(function (resolve, reject) {
          try {
            windowStage.loadContent(null, (err, data) => {
              console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets)' + JSON.stringify(err));
              try {
                expect(false).assertTrue();
              } catch (error) {
                console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
              }
              resolve(data)
            });
          } catch (err) {
            console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets) catch err' + JSON.stringify(err));
            try {
              expect(err.code == 401).assertTrue();
            } catch (error) {
              console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
            }
          }
          console.log(msgStr + 'end');
          done();
        })
      }

      await loadContent()
        .then(function (params) {
          console.log(msgStr + 'loadContent then: ' + JSON.stringify(params))
        })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_011
     * @tc.name       Test loadContentTest11
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest11', 0, async function (done) {
      let caseName = 'loadContentTest11';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function loadContent() {
        return new Promise(function (resolve, reject) {
          windowStage.loadContent('pages/index/index.ets', abilityStorage, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'windowStage.loadContent', done);
              console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets)' + JSON.stringify(err));
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'windowStage.loadContent end data=' + JSON.stringify(data));
            }
            resolve(data)
            done();
          })
        })
      }

      await loadContent()
        .then(function (params) {
          console.log(msgStr + 'loadContent then: ' + JSON.stringify(params))
        })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_012
     * @tc.name       Test loadContentTest12
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest12', 0, async function (done) {
      let caseName = 'loadContentTest12';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function loadContent() {
        return new Promise(function (resolve, reject) {
          try {
            windowStage.loadContent(null, abilityStorage, (err, data) => {
              console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets)' + JSON.stringify(err));
              try {
                expect(false).assertTrue();
              } catch (error) {
                console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
              }
              resolve(data)
            });
          } catch (err) {
            console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets) catch err ' + JSON.stringify(err));
            try {
              expect(err.code === 401).assertTrue();
            } catch (error) {
              console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
            }
          }
          done();
        })
      }

      await loadContent()
        .then(function (params) {
          console.log(msgStr + 'loadContent then: ' + JSON.stringify(params))
        })
    })
    /**
     * @tc.number     SUB_WINDOW_CREATESUBWINDOW_JSAPI_003
     * @tc.name       Test createSubWindowTest3
     * @tc.desc       Verify the scenario of creating an auxiliary window
     */
    it('createSubWindowTest3', 0, async function (done) {
      let caseName = 'createSubWindowTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null

      function createSubWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.createSubWindow('createSubWindowTest3', (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
              console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest3) err=' + JSON.stringify(err));
            } else {
              try {
                tempWnd = data
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`windowStage.createSubWindow catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'windowStage.createSubWindow end data=' + JSON.stringify(data));
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find('createSubWindowTest3', (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy(params) {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function findAgain(params) {
        return new Promise(function (resolve, reject) {
          ohosWindow.find('createSubWindowTest3', (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              try {
                expect(true).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            }
            resolve(data)
            done();
          })
        })
      }

      await createSubWindow()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return find()
        }).then(function (params) {
          return destroy(params)
        }).then(function (params) {
          return findAgain(params)
        })
    })
    /**
     * @tc.number     SUB_WINDOW_CREATESUBWINDOW_JSAPI_004
     * @tc.name       Test createSubWindowTest4
     * @tc.desc       Verify the scene of entering illegal values to create an auxiliary window
     */
    it('createSubWindowTest4', 0, async function (done) {
      let caseName = 'createSubWindowTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function createSubWindow() {
        return new Promise(function (resolve, reject) {
          try {
            windowStage.createSubWindow(null, (err, data) => {
              console.log(msgStr + 'windowStage.createSubWindow(null) err=' + JSON.stringify(err));
              try {
                expect(false).assertTrue();
              } catch (error) {
                console.info(`windowStage.createSubWindow catch error: ${JSON.stringify(error)}`)
              }
              resolve(data)
            });
          } catch (err) {
            try {
              expect(err.code === 401).assertTrue();
            } catch (error) {
              console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'windowStage.createSubWindow(null) catch err=' + JSON.stringify(err));
          }
          done();
        })
      }

      await createSubWindow()
        .then(function (params) {
          console.log(msgStr + 'getMainWindow then: ' + JSON.stringify(params))
        })
    })
    /**
     * @tc.number     SUB_WINDOW_GETSUBWINDOW_JSAPI_002
     * @tc.name       Test getSubWindowTest2
     * @tc.desc       Verify the scene of obtaining all auxiliary sub windows
     */
    it('getSubWindowTest2', 0, async function (done) {
      let caseName = 'getSubWindowTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');

      function getSubWindow() {
        return new Promise(function (resolve, reject) {
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
              console.log(msgStr + 'windowStage.getSubWindow end data=' + JSON.stringify(data));
            }
            resolve(data)
            done();
          })
        })
      }

      await getSubWindow()
        .then(function (params) {
          console.log(msgStr + 'getMainWindow then: ' + JSON.stringify(params))
        })
    })
    /**
     * @tc.number     SUB_WINDOW_SETPRIVACYMODE_JSAPI_002
     * @tc.name       Test setPrivacyModeTest2
     * @tc.desc       Verify the scene where the application sub window is set as a security layer
     */
    it('setPrivacyModeTest2', 0, async function (done) {
      let caseName = 'setPrivacyModeTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin ohosWindow =' + JSON.stringify(ohosWindow));
      let mainWnd = null;

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, 'setPrivacyModeTest2', ohosWindow.WindowType.TYPE_SYSTEM_ALERT, (err, data) => {
            if (err && err.code) {
              console.log(msgStr + 'ohosWindow.create fail err:' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
              }
            } else {
              try {
                expect(data != null).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'ohosWindow.create success data' + data);
              mainWnd = data;
              resolve(data)
            }
          })
        })
      }

      function getProperties() {
        return new Promise(function (resolve, reject) {
          mainWnd.getProperties((err, data) => {
            if (err.code != 0) {
              console.log(msgStr + 'mainWnd.getProperties first data.isPrivacyMode=false err: ' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`mainWnd.getProperties catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              console.log(msgStr + 'mainWnd.getProperties first data.isPrivacyMode=fasle data:' + JSON.stringify(data));
              try {
                expect(!data.isPrivacyMode).assertTrue();
              } catch (error) {
                console.info(`mainWnd.getProperties catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function setPrivacyModeTrue() {
        return new Promise(function (resolve, reject) {
          mainWnd.setPrivacyMode(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'mainWnd.setPrivacyMode', done);
              console.log(msgStr + 'mainWnd.setPrivacyMode(true) err=' + JSON.stringify(err));
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`mainWnd.setPrivacyMode catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'mainWnd.setPrivacyMode true data=' + JSON.stringify(data));
            }
            resolve(data)
          })
        })
      }

      function getProperties2() {
        return new Promise(function (resolve, reject) {
          mainWnd.getProperties((err, data) => {
            if (err.code != 0) {
              console.log(msgStr + 'mainWnd.getProperties second isPrivacyMode=true fail err: ' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`mainWnd.getProperties catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              console.log(msgStr + 'mainWnd.getProperties second isPrivacyMode=true callback data:' + JSON.stringify(data));
              try {
                expect(data.isPrivacyMode).assertTrue();
              } catch (error) {
                console.info(`mainWnd.getProperties catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function setPrivacyModeFalse() {
        return new Promise(function (resolve, reject) {
          mainWnd.setPrivacyMode(false, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'mainWnd.setPrivacyMode', done);
              console.log(msgStr + 'mainWnd.setPrivacyMode(false) err=' + JSON.stringify(err));
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`mainWnd.setPrivacyMode catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'mainWnd.setPrivacyMode(false) end data=' + JSON.stringify(data));
            }
            resolve(data)
          })
        })
      }

      function getProperties3() {
        return new Promise(function (resolve, reject) {
          mainWnd.getProperties((err, data) => {
            if (err.code != 0) {
              console.log(msgStr + 'mainWnd.getProperties data.isPrivacyMode=fasle callback fail err: ' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`mainWnd.getProperties catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              console.log(msgStr + 'mainWnd.getProperties data.isPrivacyMode=fasle callback data:' + JSON.stringify(data));
              try {
                expect(!data.isPrivacyMode).assertTrue();
              } catch (error) {
                console.info(`mainWnd.getProperties catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find('setPrivacyModeTest2', (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy(params) {
        return new Promise(function (resolve, reject) {
          mainWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function findAgain(params) {
        return new Promise(function (resolve, reject) {
          ohosWindow.find('setPrivacyModeTest2', (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              try {
                expect(true).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            }
            resolve(data)
            done();
          })
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return getProperties()
        })
        .then(function (params) {
          console.log(msgStr + 'getProperties then: ' + JSON.stringify(params))
          return setPrivacyModeTrue()
        })
        .then(function (params) {
          console.log(msgStr + 'setPrivacyModeTrue then: ' + JSON.stringify(params))
          return getProperties2()
        })
        .then(function (params) {
          console.log(msgStr + 'getProperties2 then: ' + JSON.stringify(params))
          return setPrivacyModeFalse()
        })
        .then(function (params) {
          console.log(msgStr + 'setPrivacyModeFalse then: ' + JSON.stringify(params))
          return getProperties3()
        })
        .then(function (params) {
          console.log(msgStr + 'getProperties3 then: ' + JSON.stringify(params))
          return find()
        })
        .then(function (params) {
          console.log(msgStr + 'find then: ' + JSON.stringify(params))
          return destroy(params)
        })
        .then(function (params) {
          console.log(msgStr + 'destroy then: ' + JSON.stringify(params))
          return findAgain(params)
        })
    })
    /**
     * @tc.number     SUB_WINDOW_SETPRIVACYMODE_JSAPI_003
     * @tc.name       Test setPrivacyModeTest3
     * @tc.desc       Verify that the auxiliary window is set as the security layer
     */
    it('setPrivacyModeTest3', 0, async function (done) {
      let caseName = 'setPrivacyModeTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin ohosWindow =' + JSON.stringify(ohosWindow));
      let mainWnd = null;

      function createSubWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.createSubWindow('setPrivacyModeTest3', (err, data) => {
            if (err && err.code) {
              console.log(msgStr + 'windowStage.createSubWindow fail err:' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              try {
                expect(data != null).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'windowStage.createSubWindow success data' + data);
              mainWnd = data;
            }
            resolve(data)
          })
        })
      }

      function getProperties() {
        return new Promise(function (resolve, reject) {
          mainWnd.getProperties((err, data) => {
            if (err.code != 0) {
              console.log(msgStr + 'mainWnd.getProperties first data.isPrivacyMode=false err: ' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              console.log(msgStr + 'mainWnd.getProperties first data.isPrivacyMode=fasle data:' + JSON.stringify(data));
              try {
                expect(!data.isPrivacyMode).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function setPrivacyModeTrue() {
        return new Promise(function (resolve, reject) {
          mainWnd.setPrivacyMode(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'mainWnd.setPrivacyMode', done);
              console.log(msgStr + 'mainWnd.setPrivacyMode(true) err=' + JSON.stringify(err));
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'mainWnd.setPrivacyMode true data=' + JSON.stringify(data));
            }
            resolve(data)
          })
        })
      }

      function getProperties2() {
        return new Promise(function (resolve, reject) {
          mainWnd.getProperties((err, data) => {
            if (err.code != 0) {
              console.log(msgStr + 'mainWnd.getProperties second isPrivacyMode=true fail err: ' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              console.log(msgStr + 'mainWnd.getProperties second isPrivacyMode=true callback data:' + JSON.stringify(data));
              try {
                expect(data.isPrivacyMode).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function setPrivacyModeFalse() {
        return new Promise(function (resolve, reject) {
          mainWnd.setPrivacyMode(false, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'mainWnd.setPrivacyMode', done);
              console.log(msgStr + 'mainWnd.setPrivacyMode(false) err=' + JSON.stringify(err));
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'mainWnd.setPrivacyMode(false) end data=' + JSON.stringify(data));
            }
            resolve(data)
          })
        })
      }

      function getProperties3() {
        return new Promise(function (resolve, reject) {
          mainWnd.getProperties((err, data) => {
            if (err.code != 0) {
              console.log(msgStr + 'mainWnd.getProperties data.isPrivacyMode=fasle callback fail err: ' + JSON.stringify(err));
              try {
                expect().assertFail();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
              done();
            } else {
              console.log(msgStr + 'mainWnd.getProperties data.isPrivacyMode=fasle callback data:' + JSON.stringify(data));
              try {
                expect(!data.isPrivacyMode).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find('setPrivacyModeTest3', (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              try {
                expect(!!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy(params) {
        return new Promise(function (resolve, reject) {
          mainWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function findAgain(params) {
        return new Promise(function (resolve, reject) {
          ohosWindow.find('setPrivacyModeTest2', (err, data) => {
            console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
            console.log(msgStr + 'ohosWindow.find !!data' + !!data);
            if (err && err.code) {
              try {
                expect(true).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            } else {
              unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
            }
            resolve(data)
            done();
          })
        })
      }

      await createSubWindow()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return getProperties()
        })
        .then(function (params) {
          console.log(msgStr + 'getProperties then: ' + JSON.stringify(params))
          return setPrivacyModeTrue()
        })
        .then(function (params) {
          console.log(msgStr + 'setPrivacyModeTrue then: ' + JSON.stringify(params))
          return getProperties2()
        })
        .then(function (params) {
          console.log(msgStr + 'getProperties2 then: ' + JSON.stringify(params))
          return setPrivacyModeFalse()
        })
        .then(function (params) {
          console.log(msgStr + 'setPrivacyModeFalse then: ' + JSON.stringify(params))
          return getProperties3()
        })
        .then(function (params) {
          console.log(msgStr + 'getProperties3 then: ' + JSON.stringify(params))
          return find()
        })
        .then(function (params) {
          console.log(msgStr + 'find then: ' + JSON.stringify(params))
          return destroy(params)
        })
        .then(function (params) {
          console.log(msgStr + 'destroy then: ' + JSON.stringify(params))
          return findAgain(params)
        })
    })

    /**
     * @tc.number     SUB_WINDOW_SETDENSITTYDPI_JSAPI_002
     * @tc.name       Test setDensityDpiTest2
     * @tc.desc       Verify Sets the screen pixel
     */
    it('setDensityDpiTest2', 0, async function (done) {
      let caseName = 'setDensityDpiTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let screens = await screenManager.getAllScreens().catch(errScreen => {
        unexpectedError(errScreen, caseName, 'screenManager.getAllScreen', done);
      })
      console.log(msgStr + 'screenManager.getAllScreen' + JSON.stringify(screens));
      try {
        expect(!!screens).assertTrue();
      } catch (error) {
        console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
      }
      let currentDeviceDefaultDpi;
      let currentDeviceDefault = null;
      display.getDefaultDisplay(async (err, data) => {
        if (err.code) {
          console.error('Failed to obtain the default display object. Code:  ' + JSON.stringify(err));
          return;
        }
        console.info('Succeeded in obtaining the default display object. Data:' + JSON.stringify(data));
        currentDeviceDefault = data;
        currentDeviceDefaultDpi = parseInt(currentDeviceDefault.densityDPI)
        let dpiItem = [-80, 80, 1000, 160, 0, 320, 188.88, 0, 640, 300, currentDeviceDefaultDpi];
        for (let i = 0; i < dpiItem.length; i++) {
          screens[0].setDensityDpi(dpiItem[i], (errDpi, dataDpi) => {
            if (errDpi.code) {
              console.error('Failed to set DensityDpi. Cause: ' + JSON.stringify(err) + dpiItem[i]);
              return;
            }
            console.log(msgStr + 'screen.setDensityDpi success set DPI ' + dpiItem[i]);
            display.getDefaultDisplay((error, result) => {
              if (error.code) {
                console.error(msgStr + 'screen.setDensityDpi display.getDefaultDisplay failed');
                return;
                console.log(msgStr + 'screen.setDensityDpi display.getDefaultDisplay' + JSON.stringify(result));
                let isEqual = Number(result.densityDPI) == parseInt(dpiItem[i])
                console.log(msgStr + 'same ? ' + isEqual)
                try {
                  expect(isEqual).assertTrue();
                } catch (error) {
                  console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
                }
              }
            })
          })
        }
      });
      console.log(msgStr + 'done ');
      done();
    })
    /**
     * @tc.number     SUB_WINDOW_SETPREFERREDORIENTATION_JSAPI_002
     * @tc.name       Test setPreferredOrientationTest2
     * @tc.desc       Sets the display direction property of the window
     */
    it('setPreferredOrientationTest2', 0, async function (done) {
      let caseName = 'setPreferredOrientationTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = null;

      function getMainWindow() {
        return new Promise(function (resolve, reject) {
          windowStage.getMainWindow((err, data) => {
            console.log(msgStr + 'getMainWindow data:' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
            }
            try {
              expect(!!data).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on ${JSON.stringify(error)}`)
            }
            mainWin = data
            resolve(data);
            console.log(msgStr + 'await windowStage  JSON.stringify(mainWin)===' + JSON.stringify(mainWin));
          })
        })
      }

      let num = 0
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
      'LANDSCAPE_INVERTED', 'AUTO_ROTATION', 'AUTO_ROTATION_PORTRAIT', 'AUTO_ROTATION_LANDSCAPE',
      'AUTO_ROTATION_RESTRICTED', 'AUTO_ROTATION_PORTRAIT_RESTRICTED', 'AUTO_ROTATION_LANDSCAPE_RESTRICTED', 'LOCKED', 'UNSPECIFIED'];

      function setPreferredOrientation(i) {
        return new Promise(function (resolve, reject) {
          let orientation = ohosWindow.Orientation[orientationItem[i]]
          mainWin.setPreferredOrientation(orientation, (err, data) => {
            if (err && err.code) {
              console.log(msgStr + 'window.setPreferredOrientation failed set error' + orientation);
            }
            num++
            if (++i < orientationItem.length) {
              setPreferredOrientation(i)
              console.log(msgStr + 'jixuzhixing  i: ' + i);
            } else {
              console.log(msgStr + 'i++<orientationItem.length  i: ' + i + '   ,orientationItem.length:' + orientationItem.length);
            }
            if (num == orientationItem.length) done();
            console.log(msgStr + 'success set window.setPreferredOrientation ' + orientation + JSON.stringify(data));
            resolve(data)
          })
        })
      }

      await getMainWindow()
        .then(function (params) {
          console.log(msgStr + 'setPreferredOrientation then: ' + JSON.stringify(params))
          return setPreferredOrientation(0)
        })
    })
    /**
     * @tc.number     SUB_WINDOW_SETFORBIDSPLITMOVE_JSAPI_002
     * @tc.name       Test setForbidSplitMoveTest2
     * @tc.desc       Sets whether Windows are forbidden to move in split screen mode
     */
    it('setForbidSplitMoveTest2', 0, async function (done) {
      let caseName = 'setForbidSplitMoveTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      try {
        expect(!!mainWin).assertTrue();
      } catch (error) {
        console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
      }
      await mainWin.setForbidSplitMove(true, (err, data) => {
        if (err.code) {
          console.log(msgStr + 'failed set window.setForbidSplitMove drag is prohibited');
          return;
        }
        console.log(msgStr + 'success set window.setForbidSplitMove drag is prohibited' + JSON.stringify(data));
      })
      await mainWin.setForbidSplitMove(false, (err, data) => {
        if (err.code) {
          console.log(msgStr + 'failed set window.setForbidSplitMove you can drag it now');
          return;
        }
        console.log(msgStr + 'success set window.setForbidSplitMove you can drag it now' + JSON.stringify(data));
      })
      console.log(msgStr + 'done ');
      done();
    })
    /**
     * @tc.number     SUB_WINDOW_SNAPSHOT_JSAPI_002
     * @tc.name       Test snapshotTest2
     * @tc.desc       Scenario of screenshot of verification window
     */
    it('snapshotTest2', 0, async function (done) {
      let caseName = 'snapshotTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      try {
        expect(!!mainWin).assertTrue();
      } catch (error) {
        console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
      }
      await mainWin.snapshot((err, data) => {
        if (err && err.code) {
          console.log(msgStr + 'snapshot err.code:' + JSON.stringify(err.code));
          return;
        }
        console.log(msgStr + 'snapshot success data:' + JSON.stringify(data));
        mainWin.on('snapshot', (err, data) => {
          if (err && err.code) {
            console.log(msgStr + 'mainWin.on(snapshot)  err.code:' + JSON.stringify(err.code));
            return;
          }
          mainWin.off('snapshot', (err, data) => {
            if (err && err.code) {
              console.log(msgStr + 'mainWin.off(snapshot) err.code:' + JSON.stringify(err.code));
              return;
            }
          })
        })
      })
      done();
    })
    /**
     * @tc.number     SUB_WINDOW_DIALOGTARGETTOUCH_JSAPI_002
     * @tc.name       Test dialogTargetTouchTest2
     * @tc.desc       Verify the scenario of opening modal window
     */
    it('dialogTargetTouchTest2', 0, async done => {
      let caseName = 'dialogTargetTouchTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let tempType = ohosWindow.WindowType.TYPE_DIALOG
      let dialogTargetTouchTest2Win = null

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, 'dialogTargetTouchTest2', tempType, (err, data) => {
            console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
            console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.create', done);
            } else {
              dialogTargetTouchTest2Win = data
              try {
                expect(!!dialogTargetTouchTest2Win).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }
            }
            resolve(data)
          })
        })
      }

      function destroy() {
        return new Promise(function (resolve, reject) {
          dialogTargetTouchTest2Win.destroy();
          resolve(true)
          done();
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return destroy()
        })
    })
    /**
     * @tc.number     SUB_WINDOW_ANIMATIONFORSHOWN_JSAPI_002
     * @tc.name       Test animationForShownTest2
     * @tc.desc       Verify window custom animation configuration of the scene
     */
    it('animationForShownTest2', 0, async function (done) {
      let caseName = 'animationForShownTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      console.log(msgStr + 'begin ohosWindow==' + JSON.stringify(ohosWindow));
      let wndId = 'animationForShownTest2';
      let baseType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
      let tempWnd = null;
      ohosWindow.create(context, wndId, baseType, (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
        } else {
          tempWnd = data
          try {
            expect(!!tempWnd).assertTrue();
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + tempWnd);
          let controller = tempWnd.getTransitionController();
          controller.animationForShown = (context: ohosWindow.TransitionContext) => {
            let toWindow = context.toWindow
            animateTo({
              duration: 1000,
              tempo: 0.5,
              curve: Curve.EaseInOut,
              delay: 0,
              iterations: 1,
              playMode: PlayMode.Normal,
            }, () => {
              var obj: ohosWindow.TranslateOptions;
              obj.x = 100.0;
              obj.y = 0.0;
              obj.z = 0.0;
              toWindow.translate(obj);
              console.info(msgStr + 'toWindow translate end');
            }
            )
            context.completeTransition(true)
            console.info(msgStr + 'complete transition end');
          }
          tempWnd.destroy();
          done();
        }
      });

    })
    /**
     * @tc.number     SUB_WINDOW_GETCUTOUTINFO_JSAPI_002
     * @tc.name       Test getCutoutInfoTest2
     * @tc.desc       Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
     */
    it('getCutoutInfoTest2', 0, async function (done) {
      let caseName = 'getCutoutInfoTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let dpClass = display.getDefaultDisplaySync();
      try {
        expect(!!dpClass).assertTrue();
      } catch (error) {
        console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
      }
      dpClass.getCutoutInfo((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'displayClass.getCutoutInfo', done);
        } else {
          console.info(msgStr + 'Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
          done();
        }
      })
    })
    /**
     * @tc.number     SUB_WINDOW_SHOWWITHANIMATION_JSAPI_002
     * @tc.name       Test showWithAnimationTest2
     * @tc.desc       Displays the current window, playing an animation in the process
     */
    it('showWithAnimationTest2', 0, async function (done) {
      let caseName = 'showWithAnimationTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let wndId = 'showWithAnimationTest2';
      let baseType = ohosWindow.WindowType.TYPE_FLOAT;
      let tempWnd = null;

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, wndId, baseType, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
            } else {
              tempWnd = data;
              console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + JSON.stringify(tempWnd));
              try {
                expect(!!tempWnd).assertTrue();
              } catch (error) {
                console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
              }

            }
            resolve(data)
          })
        })
      }

      function showWithAnimation() {
        return new Promise(function (resolve, reject) {
          tempWnd.showWithAnimation((error, animationData) => {
            if (error && error.code) {
              unexpectedError(error, caseName, 'Failed to show the window with animation', done);
            } else {
              console.info('Succeeded in showing the window with animation. Data: ' + JSON.stringify(animationData));
              resolve(animationData)
            }
          })
        })
      }

      function destroy() {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy();
          resolve(true)
          done();
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return showWithAnimation()
        }).then(function (params) {
          console.log(msgStr + 'showWithAnimation then: ' + JSON.stringify(params))
          return destroy()
        })
    })
    /**
     * @tc.number     SUB_WINDOW_HIDEWITHANIMATION_JSAPI_002
     * @tc.name       Test hideWithAnimationTest2
     * @tc.desc       Hide the current window and play an animation in the process
     */
    it('hideWithAnimationTest2', 0, async function (done) {
      let caseName = 'hideWithAnimationTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let wndId = 'hideWithAnimationTest2';
      let baseType = ohosWindow.WindowType.TYPE_FLOAT;
      let tempWnd = null

      function create() {
        return new Promise(function (resolve, reject) {
          ohosWindow.create(context, wndId, baseType, (creare_err, data) => {
            if (creare_err && creare_err.code) {
              unexpectedError(creare_err, caseName, 'ohosWindow.create ' + baseType, done);
            }
            try {
              tempWnd = data
              expect(!!tempWnd).assertTrue();
            } catch (error) {
              console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
            }
            resolve(data)
          })
        })
      }

      function find() {
        return new Promise(function (resolve, reject) {
          ohosWindow.find(wndId, (findErr, findWnd) => {
            if (findErr && findErr.code) {
              unexpectedError(findErr, caseName, 'Failed to hide the window with animation', done);
            } else {
              findWnd.hideWithAnimation((err, data) => {
                if (err && err.code) {
                  unexpectedError(err, caseName, 'Failed to hide the window with animation', done);
                } else {
                  console.info('Succeeded in hiding the window with animation. Data: ' + JSON.stringify(data));
                  done();
                }
              })
            }
            resolve(findWnd)
          })
        })
      }

      function destroy() {
        return new Promise(function (resolve, reject) {
          tempWnd.destroy();
          resolve(true)
          done();
        })
      }

      await create()
        .then(function (params) {
          console.log(msgStr + 'create then: ' + JSON.stringify(params))
          return find()
        }).then(function (params) {
          console.log(msgStr + 'find then: ' + JSON.stringify(params))
          return destroy()
        })
    })
  }
  )
}
