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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index"
import ohosWindow from '@ohos.window';

export default function windowPromiseTest(context, windowStage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  describe('window_api_test', function () {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG = true;
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
    var systemWindowValueArr = [];
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
    var newWindowObj = null;
    const WINDOW_NAME = 'windowName';

    beforeAll(function () {
      console.log('jsunittest beforeall ohosWindow.WindowType='+JSON.stringify(ohosWindow.WindowType));
      appWindowTypeArr = Object.keys(appWindowTypeDic);
      systemWindowValueArr = Object.keys(systemWindowTypeDic);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
      for(i in ohosWindow.WindowType){
        windowTypeArr.push(ohosWindow.WindowType[i])
      }
    })
    beforeEach(function () {
    })
    afterEach(async function (done) {
      windowCount++;
      if (listenerData.on) {
        listenerData.on = false;
        console.log('jsunittest afterEach listener off, listenerData:' + JSON.stringify(listenerData));
        if (listenerData.typeStr === 'systemBarTintChange') {
          ohosWindow.off(listenerData.typeStr);
        } else if (newWindowObj) {
          newWindowObj.off(listenerData.typeStr);
        }
        await sleep(3000);
      }
      done();
    })
    afterAll(function () {
    })

    function expectedError(error, caseName, apiName, done) {
      let msgStr = 'jsunittest ' + caseName + ' ' + apiName + ' failed, err: ';
      console.log(msgStr + JSON.stringify(error));
      expect(TRUE_FLAG).assertTrue();
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
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_001
	  * @tc.name       Test setSystemBarEnableTest1
	  * @tc.desc       Verify that the scene shows the status bar and hides the navigation bar
	  */
    it('setSystemBarEnableTest1', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === 2108 && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            } else if (tempData.type === 2112 && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            }
            if (statusFlag === listenerStatus.finished && navigationFlag === listenerStatus.finished) {
              done();
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['status']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status]) success');
      setTimeout(() => {
        if (statusFlag !== listenerStatus.finished || navigationFlag !== listenerStatus.finished) {
          let apiStr = 'tempWnd.on systemBarTintChange time wait';
          unexpectedError(null, caseName, apiStr, done);
        }
      }, 5000)
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_002
	  * @tc.name       Test setSystemBarEnableTest2
	  * @tc.desc       Verify that the scene hides the status bar and displays the navigation bar
	  */
    it('setSystemBarEnableTest2', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === 2108 && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            } else if (tempData.type === 2112 && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            }
            if (statusFlag === listenerStatus.finished && navigationFlag === listenerStatus.finished) {
              done();
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([navigation]) success');
      setTimeout(() => {
        if (statusFlag !== listenerStatus.finished || navigationFlag !== listenerStatus.finished) {
          let apiStr = 'tempWnd.on systemBarTintChange time wait';
          unexpectedError(null, caseName, apiStr, done);
        }
      }, 5000)
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_003
	  * @tc.name       Test setSystemBarEnableTest3
	  * @tc.desc       Verify that the scene displays both the status bar and the navigation bar
	  */
    it('setSystemBarEnableTest3', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === 2108 && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            } else if (tempData.type === 2112 && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(tempData.isEnable).assertTrue();
            }
            if (statusFlag === listenerStatus.finished && navigationFlag === listenerStatus.finished) {
              done();
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      setTimeout(() => {
        if (statusFlag !== listenerStatus.finished || navigationFlag !== listenerStatus.finished) {
          let apiStr = 'tempWnd.on systemBarTintChange time wait';
          unexpectedError(null, caseName, apiStr, done);
        }
      }, 5000)
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_004
	  * @tc.name       Test setSystemBarEnableTest4
	  * @tc.desc       Verify that the scene hides both the status bar and the navigation bar
	  */
    it('setSystemBarEnableTest4', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let statusFlag = listenerStatus.ready;
      let navigationFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (statusFlag === listenerStatus.pending || navigationFlag === listenerStatus.pending) {
          console.log(msgStr + 'systemBarTintChange compare start!');
          expect(!!systemBarData).assertTrue();
          expect(!!systemBarData.regionTint).assertTrue();
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            let tempData = systemBarData.regionTint[i];
            console.log(msgStr + 'compare, type: ' + tempData.type + ';isEnable: ' + tempData.isEnable);
            if (tempData.type === 2108 && statusFlag === listenerStatus.pending) {
              statusFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            } else if (tempData.type === 2112 && navigationFlag === listenerStatus.pending) {
              navigationFlag = listenerStatus.finished;
              expect(!tempData.isEnable).assertTrue();
            }
            if (statusFlag === listenerStatus.finished && navigationFlag === listenerStatus.finished) {
              done();
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      statusFlag = listenerStatus.pending;
      navigationFlag = listenerStatus.pending;
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      setTimeout(() => {
        if (statusFlag !== listenerStatus.finished || navigationFlag !== listenerStatus.finished) {
          let apiStr = 'tempWnd.on systemBarTintChange time wait';
          unexpectedError(null, caseName, apiStr, done);
        }
      }, 5000)
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_005
	  * @tc.name       Test setSystemBarEnableTest5
	  * @tc.desc       Verify the scene where illegal values are entered when the status bar and navigation bar are displayed
	  */
    it('setSystemBarEnableTest5', 0, async function (done) {
      let caseName = 'setSystemBarEnableTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable([]).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([]) success');
      await tempWnd.setSystemBarEnable([null, '123']).catch((err) => {
        expectedError(err, caseName, 'tempWnd.setSystemBarEnable([null, 123])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([null, 123]) finished');
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_001
	  * @tc.name       Test setSystemBarPropertiesTest1
	  * @tc.desc       Verify the scene where the colors of the status bar and navigation bar are set in RGB
	  */
    it('setSystemBarPropertiesTest1', 0, async function (done) {
      let caseName = 'setSystemBarPropertiesTest1';
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
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      listenerFlag = listenerStatus.pending;
      let loopCount = commonRGBColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonRGBColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationContentColor: tempColor,
        };
        tempWnd.setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect(TRUE_FLAG).assertFail();
          done();
        })
      }
      setTimeout(() => {
        console.log(msgStr + 'time wait finished. compareCount: ' + compareCount);
        listenerFlag = listenerStatus.finished;
        done();
      }, 10000)
    })

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_002
	  * @tc.name       Test setSystemBarPropertiesTest2
	  * @tc.desc       Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
	  */
    it('setSystemBarPropertiesTest2', 0, async function (done) {
      let caseName = 'setSystemBarPropertiesTest2';
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
              expect(backgroundIndex !== -1).assertTrue();
              expect(contentColorIndex !== -1).assertTrue();
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
              expect(backgroundIndex !== -1).assertTrue();
              expect(contentColorIndex !== -1).assertTrue();
            }
          }
        }
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      listenerFlag = listenerStatus.pending;
      let loopCount = commonNUMBERColorArr.length;
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
        tempWnd.setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect(TRUE_FLAG).assertFail();
          done();
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

    /**
	  * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_003
	  * @tc.name       Test setSystemBarPropertiesTest3
	  * @tc.desc       Verify the scene where the status bar and navigation bar colors are set as keywords
	  */
    it('setSystemBarPropertiesTest3', 0, async function (done) {
      let caseName = 'setSystemBarPropertiesTest3';
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
      let tempWnd = await windowStage.getMainWindow().catch((err) => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
      expect(!!tempWnd).assertTrue();
      await tempWnd.show().catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.show', done);
      });
      console.log(msgStr + 'tempWnd.show success');
      await tempWnd.setFullScreen(true).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setFullScreen(true)', done);
      });
      console.log(msgStr + 'tempWnd.setFullScreen(true) success');
      await tempWnd.setSystemBarEnable(['status', 'navigation']).catch((err) => {
        unexpectedError(err, caseName, 'tempWnd.setSystemBarEnable([status, navigation])', done);
      });
      console.log(msgStr + 'tempWnd.setSystemBarEnable([status, navigation]) success');
      await sleep(1000);
      listenerFlag = listenerStatus.pending;
      let loopCount = commonKEYColorArr.length;
      for (let i = 0; i < loopCount; i++) {
        let tempColor = commonKEYColorArr[i];
        let systemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationContentColor: tempColor,
        };
        tempWnd.setSystemBarProperties(systemBarProperties).then(() => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties ' + tempColor + ' success');
        }, (err) => {
          console.log(msgStr + 'tempWnd.setSystemBarProperties failed, err : ' + JSON.stringify(err));
          expect(TRUE_FLAG).assertFail();
          done();
        })
      }
      setTimeout(() => {
        console.log(msgStr + 'time wait finished. compareCount: ' + compareCount);
        listenerFlag = listenerStatus.finished;
        done();
      }, 10000)
    })

    /**
	 * @tc.number     SUB_WINDOW_CREATE_JSAPI_001
	 * @tc.name       Test create
	 * @tc.desc       Verify the scenario of creating the application type window
	 */
    it('createTest1', 0, async function (done) {
      let caseName = 'createTest1';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = appWindowTypeArr.length;
      console.log('jsunittest loopCount: ' + loopCount);
      for (let i = 0; i < loopCount; i++) {
        let tempType = appWindowTypeDic[appWindowTypeArr[i]];
        let windId = 'createTest1' + i;
        console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
        let tempWnd = await ohosWindow.create(context, windId, tempType).catch((err) => {
            console.log(msgStr + 'ohosWindow.create ' + tempType + 'catched, err: ' + JSON.stringify(err));
              expectedError(err, caseName, 'ohosWindow.create ' + tempType, done);
        });
        console.log(msgStr + 'ohosWindow.create ' + tempType + 'finished, wnd: ' + tempWnd);
        expect(!tempWnd).assertTrue();
        if (i === loopCount - 1) {
        }
      }
      console.log(msgStr + 'done ');
      done();
    })
    /**
	 * @tc.number     SUB_WINDOW_CREATE_JSAPI_003
	 * @tc.name       Test createTest3
	 * @tc.desc       Verify the scenario of creating a window of a type that does not exist
	 */
    it('createTest3', 0, async function (done) {
      let caseName = 'createTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'nonExistWindowType';
      console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
      let nonExistWnd = await ohosWindow.create(context, windId, tempType).catch((err) => {
        console.log(msgStr + 'ohosWindow.create err: ' + JSON.stringify(err));
        expect(err.code === 130).assertTrue();
        done();
      });
    })
  })
}
