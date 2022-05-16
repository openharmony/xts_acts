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

// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index"
import ohosWindow from '@ohos.window';
import display from '@ohos.display';

export default function windowCallbackTest(context, windowStage, abilityStorage) {

  console.log('testets context 1: ' + JSON.stringify(context))
  console.log('testets context 1 windowStage 2 : ' + JSON.stringify(windowStage));
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
      'TYPE_FLOAT': 8
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
    beforeAll(function () {
      appWindowTypeArr = Object.keys(appWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      for (i in ohosWindow.WindowType) {
        windowTypeArr.push(ohosWindow.WindowType[i]);
      }
      console.log('jsunittest beforeall');
      console.log(msgStr + 'beforeall ohosWindow.windowType' + JSON.stringify(ohosWindow.windowType))
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
      expect(TRUE_FLAG).assertTrue();
      expect(error.code === code).assertTrue();
      done();
    }

    function unexpectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      expect(TRUE_FLAG).assertFail();
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
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_010
     * @tc.name       Test setSystemBarEnableTest10
     * @tc.desc       Verify the scene where illegal values are entered when the navigation bar and status bar are displayed or hidden
     */
    it('setSystemBarEnableTest10', 0, function(done) {
      let caseName = 'setSystemBarEnableTest10';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', systembartintstate => {
        console.log(msgStr + 'ohosWindow.on systemBarTintChange ：' + JSON.stringify(systembartintstate));
        console.log(msgStr + 'ohosWindow.on systemBarTintChange systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
        if (flagStatus || flagNav) {
          expect(!!systembartintstate).assertTrue();
          done();
        }
      })
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');
      windowStage.getMainWindow((err, data) => {
        if (err && err.code) {
          unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
        }
        expect(!!data).assertTrue();
        mainWnd = data;
        console.log(msgStr + 'await windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
        mainWnd.show((err, data) => {
          if (err && err.code) {
            unexpectedError(data, caseName, 'mainWnd.show', done);
          }
          console.log(msgStr + 'mainWnd.show success');
          expect(!data).assertTrue();
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setFullScreen true', done);
            }
            expect(!data).assertTrue();
            mainWnd.setSystemBarEnable([], (err, data) => {
              console.log(msgStr + 'mainWnd.setSystemBarEnable [] JSON.stringfy(data)==' + JSON.stringify(data));
              if (err && err.code) {
                unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable []', done);
              }
              flagStatus = true;
              flagNav = true;
              expect(!data).assertTrue();
              mainWnd.setSystemBarEnable([null, '123'], (err, data) => {
                if (err && err.code) {
                  expect(err.code === 130).assertTrue();
                  done();
                } else {
                  unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [null,123]', done);
                }
              })
            })
          })
        })
      })
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_004
     * @tc.name       Test setSystemBarPropertiesTest1
     * @tc.desc       TVerify the scene where the colors of the status bar and navigation bar are set in RGB
     */
    it('setSystemBarPropertiesTest4', 0, function(done) {
      let caseName = 'setSystemBarPropertiesTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonRGBColorArr));
      let compareCount = 0;
      let listenerFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag === listenerStatus.pending) {
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            if (tempData.type === 2108 || tempData.type === 2112) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.indexOf(tempData.contentColor);
              expect(backgroundIndex === -1).assertTrue();
              expect(contentColorIndex === -1).assertTrue();
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      windowStage.getMainWindow((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
        }
        let tempWnd = data
        expect(!!tempWnd).assertTrue();
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
        tempWnd.show((err, data) => {
          if (err && err.code) {
            unexpectedError(err, caseName, 'tempWnd.show', done);
          }
          expect(!data).assertTrue();
          console.log(msgStr + 'tempWnd.show success');
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            expect(!data).assertTrue();
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');
            tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
              if (err && err.code) {
                unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
              }
              expect(!data).assertTrue();
              console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
              listenerFlag = listenerStatus.pending;
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
                })
              }
              setTimeout(() => {
                console.log(msgStr + 'time wait finished. compareCount: ' + compareCount);
                listenerFlag = listenerStatus.finished;
                done();
              }, 10000)
            })
          })
        })
      })
    })
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_005
     * @tc.name       Test setSystemBarPropertiesTest5
     * @tc.desc       Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     */
    it('setSystemBarPropertiesTest5', 0, function(done) {
      let caseName = 'setSystemBarPropertiesTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = {
        SBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        SCC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NBC: JSON.parse(JSON.stringify(commonNUMBERColorArr)),
        NCC: JSON.parse(JSON.stringify(commonNUMBERColorArr))
      };
      let compareCount = 0;
      let listenerFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag === listenerStatus.pending) {
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            if (tempData.type === 2108) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.SBC.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.SCC.indexOf(tempData.contentColor);
              if (backgroundIndex >= 0) {
                cloneColorArr.SBC.splice(backgroundIndex, 1);
              }
              if (contentColorIndex >= 0) {
                cloneColorArr.SCC.splice(contentColorIndex, 1);
              }
            } else if (tempData.type === 2112) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.NBC.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.NCC.indexOf(tempData.contentColor);
              if (backgroundIndex >= 0) {
                cloneColorArr.NBC.splice(backgroundIndex, 1);
              }
              if (contentColorIndex >= 0) {
                cloneColorArr.NCC.splice(contentColorIndex, 1);
              }
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      windowStage.getMainWindow((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
        }
        let tempWnd = data
        expect(!!tempWnd).assertTrue();
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
        tempWnd.show((err, data) => {
          if (err && err.code) {
            unexpectedError(err, caseName, 'tempWnd.show', done);
          }
          expect(!data).assertTrue();
          console.log(msgStr + 'tempWnd.show success');
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            expect(!data).assertTrue();
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');
            tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
              if (err && err.code) {
                unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
              }
              expect(!data).assertTrue();
              console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
              listenerFlag = listenerStatus.pending;
              let loopCount = commonNUMBERColorArr.length
              for (let i = 0; i < loopCount; i++) {
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
                    expect(TRUE_FLAG).assertFail();
                    done();
                  }
                })
              }
              setTimeout(() => {
                console.log(msgStr + 'time wait finished. compareCount: ' + compareCount);
                listenerFlag = listenerStatus.finished;
                let ca = cloneColorArr;
                if (ca.NCC.length || ca.NBC.length || ca.SBC.length || ca.SCC.length) {
                  unexpectedError(null, caseName, ' something compaer failed', done);
                } else {
                  done();
                }
              }, 10000)
            })
          })
        })
      })
    })
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_006
     * @tc.name       Test setSystemBarPropertiesTest6
     * @tc.desc       TVerify the scene where the status bar and navigation bar colors are set as keywords
     */
    it('setSystemBarPropertiesTest6', 0, function(done) {
      let caseName = 'setSystemBarPropertiesTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let cloneColorArr = JSON.parse(JSON.stringify(commonKEYColorArr));
      let compareCount = 0;
      let listenerFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag === listenerStatus.pending) {
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            if (tempData.type === 2108 || tempData.type === 2112) {
              console.log(msgStr + 'systemBarTintChange compare start!');
              compareCount++;
              let backgroundIndex = cloneColorArr.indexOf(tempData.backgroundColor);
              let contentColorIndex = cloneColorArr.indexOf(tempData.contentColor);
              expect(backgroundIndex === -1).assertTrue();
              expect(contentColorIndex === -1).assertTrue();
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      windowStage.getMainWindow((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
        }
        let tempWnd = data
        expect(!!tempWnd).assertTrue();
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
        tempWnd.show((err, data) => {
          if (err && err.code) {
            unexpectedError(err, caseName, 'tempWnd.show', done);
          }
          expect(!data).assertTrue();
          console.log(msgStr + 'tempWnd.show success');
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            expect(!data).assertTrue();
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');
            tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
              if (err && err.code) {
                unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
              }
              expect(!data).assertTrue();
              console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
              listenerFlag = listenerStatus.pending;
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
                    expect(TRUE_FLAG).assertFail();
                    done();
                  }
                })
              }
              setTimeout(() => {
                console.log(msgStr + 'time wait finished. compareCount: ' + compareCount);
                listenerFlag = listenerStatus.finished;
                done();
              }, 10000)
            })
          })
        })
      })
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_005
     * @tc.name       Test create5
     * @tc.desc       Verify the scenario of creating the application type window
     */
    it('createTest5', 0, function(done) {
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
            expect(err.code === 130).assertTrue();
            console.log(msgStr + 'ohosWindow.create err.code==' + JSON.stringify(err.code))
            if (i === loopCount - 1) {
              done();
            }
          } else {
            expectedError(err, caseName, 'ohosWindow.create ' + tempType, done);
          }
        })
      }
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_006
     * @tc.name       Test createTest6
     * @tc.desc       Verify the scenario of creating the system type window
     */
    it('createTest6', 0, function(done) {
      let caseName = 'createTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log('jsunittest loopCount: ' + loopCount);
      for (let i = 0; i < loopCount; i++) {
        let tempType = ohosWindow.WindowType.TYPE_SYSTEM_ALERT;
        let windId = 'createTest6' + i;
        console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
        ohosWindow.create(context, windId, tempType, (err, data) => {
          console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
          console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
          if (err && err.code) {
            unexpectedError(err, caseName, 'ohosWindow.create ' + tempType, done);
            return;
          }
          expect(!!data).assertTrue();
          let tempWnd = data
          console.log(msgStr + 'ohosWindow.create ' + tempType + ' wnd: ' + tempWnd);
          tempWnd.getProperties((err, data) => {
            console.log(msgStr + 'tempWnd.getProperties err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.getProperties data' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.getProperties', done);
              console.log(msgStr + 'tempWnd.getProperties err&&err.code' + JSON.stringify(err));
              return;
            }
            console.log(msgStr + 'tempWnd.getProperties success, !!data : ' + !!data);
            expect(!!data).assertTrue();
            expect(data.type == tempType).assertTrue();
            if (i === loopCount - 1) {
              done();
            }
          })
        })
      }
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_007
     * @tc.name       Test createTest7
     * @tc.desc       Verify the scenario of creating a window of a type that does not exist
     */
    it('createTest7', 0, function(done) {
      let caseName = 'createTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'createTest7';
      console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
      ohosWindow.create(context, windId, tempType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create  data' + JSON.stringify(data));
        if (err && err.code) {
          expect(err.code === 130).assertTrue();
          done();
          return;
        }
        expectedError(err, caseName, 'ohosWindow.create', done);
      })
    })

    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_008
     * @tc.name       Test createTest8
     * @tc.desc       Verify the scenario of creating a window with duplicate IDs
     */
    it('createTest8', 0, function(done) {
      let caseName = 'createTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'sameid'
      ohosWindow.create(context, windowId, 1, (err, data) => {
        console.log(msgStr + 'ohosWindow.create 1 once err: ' + JSON.stringify(err));
        if (err && err.code) {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
        expect(!!data).assertTrue();
        ohosWindow.create(context, windowId, 1, (err, data) => {
          console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
          if (err && err.code) {
            console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
            expect(err.code).assertEqual(120)
            done();
          } else {
            unexpectedError(err, caseName, 'ohosWindow.create', done);
            console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
          }
        })
      })
    })
    /**
     * @tc.number     SUB_WINDOW_ON_OFF_JSAPI_005
     * @tc.name       Test listenerTest5
     * @tc.desc       Verify whether the change of avoidance area and change monitoring can be turned on normally
     */
    it('listenerTest5', 0, function(done) {
      let caseName = 'listenerTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let listenerOnFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      let tempWnd = null;
      windowStage.getMainWindow((err, data) => {
        console.log(msgStr + 'windowStage.getMainWindow err: ' + JSON.stringify(err));
        console.log(msgStr + 'windowStage.getMainWindow data: ' + JSON.stringify(data));
        if (err && err.code) {
          unexpectedError(err, caseName, 'tempWnd.show', done);
        }
        tempWnd = data
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
        expect(!!tempWnd).assertTrue();
        tempWnd.show((err, data) => {
          if (err && err.code) {
            unexpectedError(err, caseName, 'tempWnd.show', done);
          }
          expect(!data).assertTrue();
          console.log(msgStr + 'tempWnd.show success');
          tempWnd.setFullScreen(true, (err, data) => {
            if (err && err.code) {
              unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
            }
            expect(!data).assertTrue();
            console.log(msgStr + 'tempWnd.setFullScreen(true) success');

            tempWnd.on('systemAvoidAreaChange', avoidAreaData => {
              console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, avoidAreaData : ' + JSON.stringify(avoidAreaData));
              if (listenerOnFlag === listenerStatus.pending) {
                listenerOnFlag = listenerStatus.finished;
                expect(!!avoidAreaData).assertTrue();
              }
              done();
            })
            tempWnd.setSystemBarEnable([], (err,data) => {
              if (err && err.code) {
                unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
              }
              expect(!data).assertTrue();
              console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
              listenerOnFlag = listenerStatus.pending;
            })
            tempWnd.setSystemBarEnable(['status', 'navigation'], (err, data) => {
              if (err && err.code) {
                unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
              }
              console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
            })
            console.log(msgStr + 'tempWnd.on systemAvoidAreaChange finished');
          })
        })
      })
    })
    /**
    * @tc.number     SUB_WINDOW_SETWINDOWTYPE_JSAPI_003
    * @tc.name       Test setWindowTypeTest3
    * @tc.desc       Verify the scenario where the normal window type is set
    */
    it('setWindowTypeTest3', 0, function(done) {
      let caseName = 'setWindowTypeTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'setWindowTypeTest3';
      console.log(msgStr + 'begin');
      let tempWnd = null
      let tempTypeArr = [];
      ohosWindow.create(context, windowId, baseWndType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
        console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
        console.log(msgStr + 'ohosWindow.create !!data' + !!data);
        if (!!data) {
          tempWnd = data
          console.log(msgStr + 'ohosWindow.create ' + baseWndType + ' wnd: ' + tempWnd);
          expect(!!tempWnd).assertTrue();
          let loopCount1 = systemWindowTypeArr;
          console.log(msgStr + 'ohosWindow.windowType' + JSON.stringify(loopCount1))
          for (let i = 1; i < loopCount1.length; i++) {
            let tempType = ohosWindow.WindowType[loopCount1[i]];
            console.log(msgStr + 'tempWnd.setWindowType ' + tempType + ' start');
            tempTypeArr.push(tempType);
            tempWnd.setWindowType(tempType, (err, data) => {
              console.log(msgStr + 'tempWnd.setWindowType err' + JSON.stringify(err));
              console.log(msgStr + 'tempWnd.setWindowType data' + JSON.stringify(data));
              console.log(msgStr + 'tempWnd.setWindowType !!data' + !!data);
              if (!data) {
                expect(!data).assertTrue();
                tempWnd.getProperties((err, data) => {
                  console.log(msgStr + 'tempWnd.getProperties err' + JSON.stringify(err));
                  console.log(msgStr + 'tempWnd.getProperties data' + JSON.stringify(data));
                  console.log(msgStr + 'tempWnd.getProperties !!data' + !!data);
                  expect(!!data).assertTrue();
                  if (!!data) {
                    tempTypeArr.splice(tempTypeArr.findIndex(item => item === data.type), 1);
                    expect((loopCount1.length - i) == (tempTypeArr.length + 1)).assertTrue();
                    if (i == loopCount1.length - 1) {
                      console.log(msgStr + 'tempWnd.getProperties i=' + i + '   ,    loopCount1.length-1==' + loopCount1.length);
                      done();
                    }
                  } else {
                    unexpectedError(err, caseName, 'tempWnd.getProperties', done);
                  }
                })
              } else {
                unexpectedError(err, caseName, 'tempWnd.setWindowType', done);
              }
              console.log(msgStr + 'tempWnd.setWindowType ' + tempType + ' end');
            })
          }
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
      })

    })
    /**
* @tc.number     SUB_WINDOW_SETWINDOWTYPE_JSAPI_004
* @tc.name       Test setWindowTypeTest4
* @tc.desc       Verify the scene of setting illegal window type
*/
    it('setWindowTypeTest4', 0, function(done) {
      let caseName = 'setWindowTypeTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let changedWndType = null;
      let windowId = 'setWindowTypeTest4';
      console.log(msgStr + 'begin');
      let tempWnd = null
      ohosWindow.create(context, windowId, baseWndType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
        console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
        console.log(msgStr + 'ohosWindow.create !!data' + !!data);
        if (!!data) {
          tempWnd = data
          expect(!!tempWnd).assertTrue();
          tempWnd.setWindowType(changedWndType, (err, data) => {
            console.log(msgStr + 'tempWnd.setWindowType err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.setWindowType data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.setWindowType !!data' + !!data);
            if (!!data) {
              expectedError(err, caseName, 'tempWnd.setWindowType', done);
            } else {
              expect(err.code == 130).assertTrue();
              done();
            }
          })
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
      })
    })
    /**
* @tc.number     SUB_WINDOW_DESTROY_JSAPI_002
* @tc.name       Test destroyTest2
* @tc.desc       Verification window destruction scenario
*/
    it('destroyTest2', 0, function(done) {
      let caseName = 'destroyTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'destroyTest2';
      console.log(msgStr + 'begin');
      let tempWnd = null
      ohosWindow.create(context, windowId, baseWndType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
        console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
        console.log(msgStr + 'ohosWindow.create !!data' + !!data);
        if (!!data) {
          tempWnd = data
          expect(!!tempWnd).assertTrue();
          tempWnd.destroy((err, data) => {
            console.log(msgStr + 'tempWnd.destroy err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.destroy data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.destroy !!data' + !!data);
            if (err && err.code) {
              unexpectedError(err, caseName, 'ohosWindow.destroy', done);
            } else {
              expect(!data).assertTrue();
              ohosWindow.find(windowId, (err, data) => {
                console.log(msgStr + 'ohosWindow.find err' + JSON.stringify(err));
                console.log(msgStr + 'ohosWindow.find data' + JSON.stringify(data));
                console.log(msgStr + 'ohosWindow.find !!data' + !!data);
                if (err && err.code) {
                  expect(err.code == 120).assertTrue();
                  done();
                } else {
                  expectedError(err, caseName, 'tempWnd.setWindowType', done);
                }
              })
            }
          })
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
      })
    })
    /**
	  * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_003
	  * @tc.name       Test loadContentTest3
	  * @tc.desc       Verify the scenario of loading an existing page
	  */
    it('loadContentTest3', 0, function(done) {
      let caseName = 'loadContentTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest3';
      console.log(msgStr + 'begin');
      let tempWnd = null
      ohosWindow.create(context, windowId, baseWndType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
        console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
        console.log(msgStr + 'ohosWindow.create !!data' + !!data);
        if (!!data) {
          tempWnd = data
          expect(!!tempWnd).assertTrue();
          tempWnd.loadContent('pages/index', (err, data) => {
            console.log(msgStr + 'tempWnd.loadContent err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.loadContent data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.loadContent !!data' + !!data);
            if (err && err.code) {
              expectedError(err, caseName, 'tempWnd.loadContent', done);
            } else {
              expect(!data).assertTrue();
              done();
            }
          })
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
      })
    })
    /**
* @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_004
* @tc.name       Test loadContentTest4
* @tc.desc       Verify the scenario of loading a page that does not exist
*/
    it('loadContentTest4', 0, function(done) {
      let caseName = 'loadContentTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest4';
      console.log(msgStr + 'begin');
      let tempWnd = null
      ohosWindow.create(context, windowId, baseWndType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
        console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
        console.log(msgStr + 'ohosWindow.create !!data' + !!data);
        if (!!data) {
          tempWnd = data
          expect(!!tempWnd).assertTrue();
          tempWnd.loadContent(null, (err, data) => {
            console.log(msgStr + 'tempWnd.loadContent err' + JSON.stringify(err));
            console.log(msgStr + 'tempWnd.loadContent data' + JSON.stringify(data));
            console.log(msgStr + 'tempWnd.loadContent !!data' + !!data);
            if (err && err.code) {
              expect(err.code === 130).assertTrue();
              done();
            } else {
              expectedError(err, caseName, 'tempWnd.loadContent', done);
            }
          })
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
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
      console.log(msgStr + 'begin');
      windowStage.loadContent('pages/index/index.ets',(err,data) => {
        if(err&&err.code){
          unexpectedError(err, caseName, 'windowStage.loadContent', done);
          console.log(msgStr+'windowStage.loadContent(pages/index/index.ets)'+JSON.stringify(err));
        }else{
          expect(!data).assertTrue();
          console.log(msgStr + 'windowStage.loadContent end data='+JSON.stringify(data));
        }
        done();
      });
    })
    /**
    * @tc.number     SUB_WINDOW_CREATESUBWINDOW_JSAPI_003
    * @tc.name       Test createSubWindowTest3
    * @tc.desc       Verify the scenario of creating an auxiliary window
    */
    it('createSubWindowTest3', 0, function (done) {
      let caseName = 'createSubWindowTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      windowStage.createSubWindow('createSubWindowTest3',(err,data)=> {
        if(err&&err.code){
          unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
          console.log(msgStr+'windowStage.createSubWindow(createSubWindowTest3) err='+JSON.stringify(err));
        }else{
          expect(!!data).assertTrue();
          console.log(msgStr + 'windowStage.createSubWindow end data='+JSON.stringify(data));
        }
        done();
      });
    })
    /**
    * @tc.number     SUB_WINDOW_CREATESUBWINDOW_JSAPI_004
    * @tc.name       Test createSubWindowTest4
    * @tc.desc       Verify the scene of entering illegal values to create an auxiliary window
    */
    it('createSubWindowTest4', 0, function (done) {
      let caseName = 'createSubWindowTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      windowStage.createSubWindow(null,(err,data)=> {
        if(err&&err.code){
          expectedError(err, caseName, 'windowStage.createSubWindow', done,130);
          console.log(msgStr+'windowStage.createSubWindow(null) err='+JSON.stringify(err));
        }else{
          expect(false).assertTrue();
          console.log(msgStr + 'windowStage.createSubWindow end data='+JSON.stringify(data));
        }
        done();
      });
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
      windowStage.getSubWindow((err,data)=> {
        if(err&&err.code){
          unexpectedError(err, caseName, 'windowStage.getSubWindow', done);
          console.log(msgStr+'windowStage.getSubWindow(null) err='+JSON.stringify(err));
        }else{
          expect(!!data).assertTrue();
          console.log(msgStr + 'windowStage.getSubWindow end data='+JSON.stringify(data));
        }
        done();
      });
    })
  })
}
