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
      try {
        expect(TRUE_FLAG).assertFail();
        ;
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
     * @tc.desc       Test ohosWindow.setSystemBarEnable API function test1.
     */
    it('setSystemBarEnableTest6', 0, function (done) {
      let caseName = 'setSystemBarEnableTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', systembartintstate => {
        console.log(msgStr + 'ohosWindow.on  systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
        if (flagStatus || flagNav) {
          try {
            expect(!!systembartintstate).assertTrue();
            expect(!!systembartintstate.regionTint).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'flagStatus || flagNav' + msgStr + 'ohosWindow.on systemBarTintChange regionTint:' + JSON.stringify(systembartintstate.regionTint));
          done();
        }
      })
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');
      console.log(msgStr + 'windowStage = ' + JSON.stringify(windowStage));
      windowStage.getMainWindow((err, data) => {
        console.log(msgStr + 'getMainWindow data2' + JSON.stringify(data));
        if (err && err.code) {
          unexpectedError(data, caseName, 'windowStage.getMainWindow', done);
        }
        try {
          expect(!!data).assertTrue();
        } catch (error) {
          console.info(`ohosWindow.on ${JSON.stringify(error)}`)
        }
        mainWnd = data;
        console.log(msgStr + 'await windowStage  JSON.stringify(mainWnd)===' + JSON.stringify(mainWnd));
        mainWnd.show((err, data) => {
          console.log(msgStr + 'mainWnd.show err' + JSON.stringify(err));
          console.log(msgStr + 'mainWnd.show data' + JSON.stringify(data));
          if (err && err.code) {
            unexpectedError(data, caseName, 'mainWnd.show', done);
          }
          expect(!data).assertTrue();
          console.log(msgStr + 'mainWnd.show success');
          mainWnd.setFullScreen(true, (err, data) => {
            console.log(msgStr + 'mainWnd.setFullScreen data:' + JSON.stringify(data));
            if (err && err.code) {
              unexpectedError(data, caseName, 'mainWnd.setFullScreen true', done);
            }
            try {
              expect(!data).assertTrue();
            } catch (error) {
              console.info(`ohosWindow.on ${JSON.stringify(error)}`)
            }
            console.log(msgStr + 'mainWnd.setFullScreen success');
            flagNav = true;
            mainWnd.setSystemBarEnable(['navigation'], (err, data) => {
              console.log(msgStr + 'mainWnd.setSystemBarEnable navigation JSON.stringify(data)==' + JSON.stringify(data));
              if (err && err.code) {
                unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [navigation]', done);
              }
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.on ${JSON.stringify(error)}`)
              }
              console.log(msgStr + 'mainWnd.setSystemBarEnable success flagNav==' + flagNav);
            })
            flagStatus = true;
            mainWnd.setSystemBarEnable(['status'], (err, data) => {
              console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(data)===' + JSON.stringify(data));
              if (err && err.code) {
                console.log(msgStr + 'mainWnd.setSystemBarEnable status JSON.stringify(err)===' + JSON.stringify(err));
                unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable [status]', done);
              }
              try {
                expect(!data).assertTrue();
              } catch (error) {
                console.info(`ohosWindow.on ${JSON.stringify(error)}`)
              }
            })
          })
        })
      })
      console.log(msgStr + 'finished!!');
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_007
     * @tc.name       Test setSystemBarEnableTest7
     * @tc.desc       Verify that the scene hides the status bar and displays the navigation bar.
     */
    it('setSystemBarEnableTest7', 0, function (done) {
      let caseName = 'setSystemBarEnableTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
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
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null')
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
              })
            })
          })
        })
      })
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_008
     * @tc.name       Test setSystemBarEnableTest8
     * @tc.desc       Verify that the scene displays both the status bar and the navigation bar.
     */
    it('setSystemBarEnableTest8', 0, function (done) {
      let caseName = 'setSystemBarEnableTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');
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
              setTimeout(() => {
                ohosWindow.on('systemBarTintChange', systembartintstate => {
                  console.log(msgStr + 'ohosWindow.on systemBarTintChange ：' + JSON.stringify(systembartintstate));
                  console.log(msgStr + 'ohosWindow.on systembartintstate.regionTint : ' + JSON.stringify(systembartintstate.regionTint));
                  setTimeout(() => {
                    if (flagStatus || flagNav) {
                      let enable = systembartintstate.regionTint[0].isEnable
                      let numType = systembartintstate.regionTint[0].type
                      console.log(msgStr + 'ohosWindow.on isEnable : ' + JSON.stringify(enable));
                      console.log(msgStr + 'ohosWindow.on numType : ' + JSON.stringify(numType));
                      try {
                        expect(numType === ohosWindow.WindowType.TYPE_NAVIGATION_BAR || enable).assertTrue();
                      } catch (error) {
                        console.info(`ohosWindow.on catch err: ${JSON.stringify(error)}`)
                      }
                    }
                    done();
                  }, 3000)
                })
              }, 2300)
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
              })
            })
          })
        })
      })
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_009
     * @tc.name       Test setSystemBarEnableTest9
     * @tc.desc       Verify that the scene hides both the status bar and the navigation bar.
     */
    it('setSystemBarEnableTest9', 0, function (done) {
      let caseName = 'setSystemBarEnableTest9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let [flagStatus, flagNav] = [false, false];
      console.log(msgStr + 'begin');
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');
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
              mainWnd.setSystemBarEnable([], (err, data) => {
                if (err && err.code) {
                  unexpectedError(data, caseName, 'mainWnd.setSystemBarEnable []', done);
                }
                try {
                  expect(!data).assertTrue();
                } catch (error) {
                  console.info(`mainWnd.setSystemBarEnable catch err: ${JSON.stringify(error)}`)
                }
              })
            })
          })
        })
      })
    });
    /**
     * @tc.number     SUB_WINDOW_SETSYSTEMBARENABLE_JSAPI_010
     * @tc.name       Test setSystemBarEnableTest10
     * @tc.desc       Verify the scene where illegal values are entered when the navigation bar and status bar are displayed or hidden
     */
    it('setSystemBarEnableTest10', 0, function (done) {
      let caseName = 'setSystemBarEnableTest10';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let mainWnd = null;
      console.log(msgStr + 'mainWnd = null');
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
    it('setSystemBarPropertiesTest4', 0, done => {
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
          try {
            expect(!!systemBarData).assertTrue();
            expect(!!systemBarData.regionTint).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
          }
          let arrLength = systemBarData.regionTint.length;
          getData(0, arrLength)

          function getData(i, length) {
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
              if (++i < length) {
                getData(i, length)
                console.log(msgStr + 'jixuzhixing  i: ' + i);
              } else {
                console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
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
        try {
          expect(!!tempWnd).assertTrue();
        } catch (error) {
          console.info(`windowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
        }
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
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
              listenerFlag = listenerStatus.pending;
              let loopCount = commonRGBColorArr.length
              getData(0, loopCount)

              function getData(i, length) {
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
                  if (++i < length) {
                    getData(i, length)
                    console.log(msgStr + 'jixuzhixing  i: ' + i);
                  } else {
                    console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
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
     * @tc.number     SUB_WINDOW_SETSYSTEMBARPROPERTIES_JSAPI_005
     * @tc.name       Test setSystemBarPropertiesTest5
     * @tc.desc       Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     */
    it('setSystemBarPropertiesTest5', 0, done => {
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
      let listenerFlag = listenerStatus.ready;
      console.log(msgStr + 'begin');
      listenerData.on = true;
      listenerData.typeStr = 'systemBarTintChange';
      ohosWindow.on('systemBarTintChange', (systemBarData) => {
        console.log(msgStr + 'tempWnd.on systemBarTintChange, systemBatData : ' + JSON.stringify(systemBarData));
        if (listenerFlag === listenerStatus.pending) {
          try {
            expect(!!systemBarData).assertTrue();
            expect(!!systemBarData.regionTint).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
          }
          let arrLength = systemBarData.regionTint.length;
          for (let i = 0; i < arrLength; i++) {
            console.log(msgStr + 'for arrLenght compareCount: ' + compareCount + ' ,i:'+i+'  ,arrLength:'+arrLength);
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
      })
      console.log(msgStr + 'tempWnd.on systemBarTintChange finished');
      windowStage.getMainWindow((err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
        }
        let tempWnd = data
        try {
          expect(!!tempWnd).assertTrue();
        } catch (error) {
          console.info(`windowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
        }
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
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
              listenerFlag = listenerStatus.pending;
              let loopCount = commonNUMBERColorArr.length
              getData(0, loopCount)

              function getData(i, length) {
                console.log(msgStr+'tempWnd.setSystemBarEnable i:'+i);
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
                  if (++i < length) {
                    getData(i, length)
                    console.log(msgStr + 'jixuzhixing  i: ' + i);
                  } else {
                    console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
                  }
                })
              }
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
    it('setSystemBarPropertiesTest6', 0, done => {
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
          try {
            expect(!!systemBarData).assertTrue();
            expect(!!systemBarData.regionTint).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.on catch error: ${JSON.stringify(error)}`)
          }
          let arrLength = systemBarData.regionTint.length;
          getData(0, arrLength)

          function getData(i, length) {
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
              if (++i < length) {
                getData(i, length)
                console.log(msgStr + 'jixuzhixing  i: ' + i);
              } else {
                console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
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
        try {
          expect(!!tempWnd).assertTrue();
        } catch (error) {
          console.info(`winsowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
        }
        console.log(msgStr + 'windowStage.getMainWindow, tempWnd: ' + tempWnd);
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
              listenerFlag = listenerStatus.pending;
              let loopCount = commonRGBColorArr.length
              getData(0, loopCount)

              function getData(i, length) {
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
                    if (++i < length) {
                      getData(i, length)
                      console.log(msgStr + 'jixuzhixing  i: ' + i);
                    } else {
                      console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
                    }
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
     * @tc.desc       Scheme of Failed to Create Application Type Window in Stage Mode
     */
    it('createTest5', 0, done => {
      let caseName = 'createTest5';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let loopCount = appWindowTypeArr.length;
      console.log(msgStr + 'loopCount: ' + loopCount);
      getData(0, loopCount)

      function getData(i, length) {
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
            console.log(msgStr + 'ohosWindow.create err.code==' + JSON.stringify(err.code))
            if (++i < length) {
              getData(i, length)
              console.log(msgStr + 'jixuzhixing  i: ' + i);
            } else {
              console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
            }
            if (i === loopCount - 1) {
              done();
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
    it('createTest6', 0, done => {
      let caseName = 'createTest6';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let loopCount = systemWindowTypeArr.length;
      console.log('jsunittest loopCount: ' + loopCount);
      getData(0, loopCount)

      function getData(i, length) {
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
          try {
            expect(!!data).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
          }
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
            try {
              expect(!!data).assertTrue();
              expect(data.type == tempType).assertTrue();
            } catch (error) {
              console.info(`tempWnd.getProperties catch error: ${JSON.stringify(error)}`)
            }
            if (++i < length) {
              getData(i, length)
              console.log(msgStr + 'jixuzhixing  i: ' + i);
            } else {
              console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
            }
          })
        })
      }
      done();
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_007
     * @tc.name       Test createTest7
     * @tc.desc       Verify the scenario of creating a window of a type that does not exist
     */
    it('createTest7', 0, done => {
      let caseName = 'createTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempType = 5000;
      let windId = 'createTest7';
      console.log(msgStr + 'ohosWindow.create ' + tempType + ' start');
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
      })
    })
    /**
     * @tc.number     SUB_WINDOW_ON_OFF_JSAPI_005
     * @tc.name       Test listenerTest5
     * @tc.desc       Verify whether the change of avoidance area and change monitoring can be turned on normally
     */
    it('listenerTest5', 0, function (done) {
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
        try {
          expect(!!tempWnd).assertTrue();
        } catch (error) {
          console.info(`windowStage.getMainWindow catch error: ${JSON.stringify(error)}`)
        }
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
            tempWnd.on('systemAvoidAreaChange', avoidAreaData => {
              console.log(msgStr + 'tempWnd.on systemAvoidAreaChange, avoidAreaData : ' + JSON.stringify(avoidAreaData));
              if (listenerOnFlag === listenerStatus.pending) {
                listenerOnFlag = listenerStatus.finished;
                try {
                  expect(!!avoidAreaData).assertTrue();
                } catch (error) {
                  console.info(`tempWnd.on catch error: ${JSON.stringify(error)}`)
                }
              }
              done();
            })
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
    it('setWindowTypeTest3', 0, function (done) {
      let caseName = 'setWindowTypeTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let tempWnd = null
      let tempTypeArr = [];
        try {
          let data = windowStage.getMainWindowSync();
          console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
          console.log(msgStr + 'ohosWindow.create !!data' + !!data);
          if (!!data) {
            tempWnd = data
//            console.log(msgStr + 'ohosWindow.create ' + baseWndType + ' wnd: ' + tempWnd);
            try {
              expect(!!tempWnd).assertTrue();
            } catch (error) {
              console.info(`ohosWindwo.create catch error: ${JSON.stringify(error)}`)
            }
            let loopCount1 = systemWindowTypeArr;
            console.log(msgStr + 'ohosWindow.windowType' + JSON.stringify(loopCount1))
            getData(0, loopCount1.length)

            function getData(i, length) {
              let tempType = ohosWindow.WindowType[loopCount1[i]];
              console.log(msgStr + 'tempWnd.setWindowType ' + tempType + ' start');
              tempTypeArr.push(tempType);
              tempWnd.setWindowType(tempType, (err, data) => {
                try {
                  console.log(msgStr + 'tempWnd.setWindowType i: ' + i);
                  console.log(msgStr + 'tempWnd.setWindowType err: ' + JSON.stringify(err));
                  console.log(msgStr + 'tempWnd.setWindowType data: ' + JSON.stringify(data));
                  console.log(msgStr + 'tempWnd.setWindowType !data: ' + !data);
                  if (!data) {
                    try {
                      expect(!data).assertTrue();
                    } catch (error) {
                      console.info(`tempWnd.setWindowType catch error: ${JSON.stringify(error)}`)
                    }
                    console.log(msgStr + 'tempWnd.getProperties start');
                    tempWnd.getProperties((err, dataProper) => {
                      try {
                        console.log(msgStr + 'tempWnd.getProperties err: ' + JSON.stringify(err));
                        console.log(msgStr + 'tempWnd.getProperties dataProper: ' + JSON.stringify(dataProper));
                        console.log(msgStr + 'tempWnd.getProperties !!dataProper: ' + !!dataProper);
                        try {
                          expect(!!dataProper).assertTrue();
                        } catch (error) {
                          console.info(`tempWnd.getProperties catch error: ${JSON.stringify(error)}`)
                        }
                        if (!!dataProper) {
                          console.log(msgStr + 'tempWnd.getProperties true  tempTypeArr: ' + JSON.stringify(tempTypeArr));
                          console.log(msgStr + 'tempWnd.getProperties true  i: ' + i);
                          tempTypeArr.splice(tempTypeArr.findIndex(item => item === dataProper.type), 1);
                          console.log(msgStr + 'tempWnd.getProperties true  tempTypeArr.length: ' + tempTypeArr.length);
                          console.log(msgStr + 'tempWnd.getProperties true  loopCount1.length: ' + loopCount1.length);
                          console.log(msgStr + 'tempWnd.getProperties true  tempTypeArr.length + 1: ' + Number(tempTypeArr.length + 1));
                          console.log(msgStr + 'tempWnd.getProperties true  (loopCount1.length - i): ' + (loopCount1.length - i));
                          console.log(msgStr + 'tempWnd.getProperties true  (tempTypeArr.length + 1): ' + (tempTypeArr.length + 1));
                          try {
                            expect(tempTypeArr.length === 0).assertTrue();
                            if (++i < length) {
                              getData(i, length)
                              console.log(msgStr + 'jixuzhixing  i: ' + i);
                            }
                          } catch (error) {
                            console.info(`tempWnd.getProperties catch error: ${JSON.stringify(error)}`)
                          }
                          if (i == loopCount1.length - 1) {
                            console.log(msgStr + 'tempWnd.getProperties i=' + i + '   ,    loopCount1.length-1==' + loopCount1.length);
                            done();
                          }
                        }
                      } catch (err) {
                        console.log(msgStr + 'tempWnd.getProperties catch err: ' + JSON.stringify(err));
                      }
                    })
                  }
                  console.log(msgStr + 'tempWnd.setWindowType ' + tempType + ' end');
                } catch (err) {
                  console.log(msgStr + 'tempWnd.setWindowType catch err: ' + JSON.stringify(err));
                }
              })
            }
          }
        } catch (err) {
          console.log(msgStr + 'ohosWindow.create catch err: ' + JSON.stringify(err));
        }
    })
    /**
     * @tc.number     SUB_WINDOW_SETWINDOWTYPE_JSAPI_004
     * @tc.name       Test setWindowTypeTest4
     * @tc.desc       Verify the scene of setting illegal window type
     */
    it('setWindowTypeTest4', 0, function (done) {
      let caseName = 'setWindowTypeTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let changedWndType = null;
      console.log(msgStr + 'begin');
      let tempWnd = null
      let data = windowStage.getMainWindowSync();
        console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
        console.log(msgStr + 'ohosWindow.create !!data' + !!data);
        if (!!data) {
          tempWnd = data
          try {
            expect(!!tempWnd).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
          }
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
              done();
            }
          })
        } 
    })
    /**
     * @tc.number     SUB_WINDOW_DESTROY_JSAPI_002
     * @tc.name       Test destroyTest2
     * @tc.desc       Verification window destruction scenario
     */
    it('destroyTest2', 0, function (done) {
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
          try {
            expect(!!tempWnd).assertTrue();
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
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
    it('loadContentTest7', 0, function (done) {
      let caseName = 'loadContentTest7';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest7';
      console.log(msgStr + 'begin');
      let tempWnd = null
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
              done();
            }
          })
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
      })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_008
     * @tc.name       Test loadContentTest8
     * @tc.desc       Verify the scenario of loading a page that does not exist
     */
    it('loadContentTest8', 0, function (done) {
      let caseName = 'loadContentTest8';
      let msgStr = 'jsunittest ' + caseName + ' ';
      let baseWndType = 1;
      let windowId = 'loadContentTest8';
      console.log(msgStr + 'begin');
      let tempWnd = null
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
              done();
            } else {
              unexpectedError(err, caseName, 'tempWnd.loadContent', done);
            }
          })
        } else {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        }
      })
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_009
     * @tc.name       Test loadContentTest9
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest9', 0, function (done) {
      let caseName = 'loadContentTest9';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
        done();
      });
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_010
     * @tc.name       Test loadContentTest10
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest10', 0, function (done) {
      let caseName = 'loadContentTest10';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.loadContent(null, (err, data) => {
          console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets)' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
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
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_011
     * @tc.name       Test loadContentTest11
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest11', 0, async function (done) {
      let caseName = 'loadContentTest11';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
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
        done();
      });
    })
    /**
     * @tc.number     SUB_WINDOW_LOADCONTENT_JSAPI_012
     * @tc.name       Test loadContentTest12
     * @tc.desc       Verify the scenario of loading an existing page
     */
    it('loadContentTest12', 0, function (done) {
      let caseName = 'loadContentTest12';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        windowStage.loadContent(null, abilityStorage, (err, data) => {
          console.log(msgStr + 'windowStage.loadContent(pages/index/index.ets)' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.loadContent catch error: ${JSON.stringify(error)}`)
          }
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
    /**
     * @tc.number     SUB_WINDOW_CREATESUBWINDOW_JSAPI_003
     * @tc.name       Test createSubWindowTest3
     * @tc.desc       Verify the scenario of creating an auxiliary window
     */
    it('createSubWindowTest3', 0, function (done) {
      let caseName = 'createSubWindowTest3';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      windowStage.createSubWindow('createSubWindowTest3', (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'windowStage.createSubWindow', done);
          console.log(msgStr + 'windowStage.createSubWindow(createSubWindowTest3) err=' + JSON.stringify(err));
        } else {
          try {
            expect(!!data).assertTrue();
          } catch (error) {
            console.info(`windowStage.createSubWindow catch error: ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'windowStage.createSubWindow end data=' + JSON.stringify(data));
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
      try {
        windowStage.createSubWindow(null, (err, data) => {
          console.log(msgStr + 'windowStage.createSubWindow(null) err=' + JSON.stringify(err));
          try {
            expect(false).assertTrue();
          } catch (error) {
            console.info(`windowStage.createSubWindow catch error: ${JSON.stringify(error)}`)
          }
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
    /**
     * @tc.number     SUB_WINDOW_GETSUBWINDOW_JSAPI_002
     * @tc.name       Test getSubWindowTest2
     * @tc.desc       Verify the scene of obtaining all auxiliary sub windows
     */
    it('getSubWindowTest2', 0, async function (done) {
      let caseName = 'getSubWindowTest2';
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
          console.log(msgStr + 'windowStage.getSubWindow end data=' + JSON.stringify(data));
        }
        done();
      });
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
      ohosWindow.create(context, 'setPrivacyModeTest2', ohosWindow.WindowType.TYPE_SYSTEM_ALERT, (err, data) => {
        if (err && err.code) {
          console.log(msgStr + 'ohosWindow.create fail err:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
          }
          done();
        } else {
          try {
            expect(data != null).assertTrue();
          } catch (error) {
            console.info(`ohosWindow.create catch error: ${JSON.stringify(error)}`)
          }
          console.log(msgStr + 'ohosWindow.create success data' + data);
          mainWnd = data;
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
                            done();
                          })
                        }
                      });
                    }
                  })
                }
              });
            }
          })
        }
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
                            done();
                          })
                        }
                      });
                    }
                  })
                }
              });
            }
          })
        }
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
        getData(0, dpiItem.length)

        function getData(i, length) {
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
                if (++i < length) {
                  getData(i, length)
                  console.log(msgStr + 'jixuzhixing  i: ' + i);
                } else {
                  console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
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
      let mainWin = await windowStage.getMainWindow().catch(err => {
        unexpectedError(err, caseName, 'windowStage.getMainWindow', done);
      });
      console.log(msgStr + 'windowStage.getMainWindow' + JSON.stringify(mainWin));
      try {
        expect(!!mainWin).assertTrue();
      } catch (error) {
        console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
      }
      let num = 0
      let orientationItem = ['UNSPECIFIED', 'PORTRAIT', 'LANDSCAPE', 'PORTRAIT_INVERTED',
      'LANDSCAPE_INVERTED', 'AUTO_ROTATION', 'AUTO_ROTATION_PORTRAIT', 'AUTO_ROTATION_LANDSCAPE',
      'AUTO_ROTATION_RESTRICTED', 'AUTO_ROTATION_PORTRAIT_RESTRICTED', 'AUTO_ROTATION_LANDSCAPE_RESTRICTED', 'LOCKED', 'UNSPECIFIED'];
      getData(0, orientationItem.length)

      async function getData(i, length) {
        let orientation = ohosWindow.Orientation[orientationItem[i]]
        await mainWin.setPreferredOrientation(orientation, (err, data) => {
          if (err && err.code) {
            console.log(msgStr + 'window.setPreferredOrientation failed set error' + orientation);
          }
          num++
          if (++i < length) {
            getData(i, length)
            console.log(msgStr + 'jixuzhixing  i: ' + i);
          } else {
            console.log(msgStr + 'i++<length  i: ' + i + '   ,length:' + length);
          }
          if (num == orientationItem.length) done();
          console.log(msgStr + 'success set window.setPreferredOrientation ' + orientation + JSON.stringify(data));
        })
      }
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
    it('dialogTargetTouchTest2', 0, done => {
      let caseName = 'dialogTargetTouchTest2';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin context==' + JSON.stringify(context));
      let tempType = ohosWindow.WindowType.TYPE_DIALOG
      ohosWindow.create(context, 'dialogTargetTouchTest2', tempType, (err, data) => {
        console.log(msgStr + 'ohosWindow.create err' + JSON.stringify(err));
        console.log(msgStr + 'ohosWindow.create data' + JSON.stringify(data));
        if (err && err.code) {
          unexpectedError(err, caseName, 'ohosWindow.create', done);
        } else {
          let dialogTargetTouchTest2Win = data
          try {
            expect(!!dialogTargetTouchTest2Win).assertTrue();
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
          dialogTargetTouchTest2Win.destroy();
          done();
        }
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
      ohosWindow.create(context, wndId, baseType, (err, data) => {
        if (err && err.code) {
          unexpectedError(err, caseName, 'ohosWindow.create ' + baseType, done);
        } else {
          let tempWnd = data;
          console.log(msgStr + 'ohosWindow.create ' + baseType + ', tempWnd: ' + JSON.stringify(tempWnd));
          try {
            expect(!!tempWnd).assertTrue();
          } catch (error) {
            console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
          }
          tempWnd.showWithAnimation((error, animationData) => {
            if (error && error.code) {
              unexpectedError(error, caseName, 'Failed to show the window with animation', done);
            } else {
              console.info('Succeeded in showing the window with animation. Data: ' + JSON.stringify(animationData));
              done();
            }
          })
        }
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
      ohosWindow.create(context, wndId, baseType, (creare_err, tempWnd) => {
        if (creare_err && creare_err.code) {
          unexpectedError(creare_err, caseName, 'ohosWindow.create ' + baseType, done);
        }
        try {
          expect(!!tempWnd).assertTrue();
        } catch (error) {
          console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
        }
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
        })
      })
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_008
     * @tc.name       Test createTest8
     * @tc.desc       Verify the scenario of creating a window with duplicate IDs
     */
    it('createTest8', 0, done => {
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
            try {
              expect(err.code).assertEqual(1001)
            } catch (error) {
              console.info(`tempWnd.show catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            unexpectedError(err, caseName, 'ohosWindow.create', done);
            console.log(msgStr + 'ohosWindow.create 1 twice data: ' + JSON.stringify(data));
          }
        })
      })
    })
    /**
     * @tc.number     SUB_WINDOW_CREATE_JSAPI_004
     * @tc.name       Test createTest4
     * @tc.desc       Verify the scenario of creating a window with duplicate IDs
     */
    it('createTest4', 0, async function (done) {
      let caseName = 'createTest4';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowId = 'sameids'
      let ohosData = await ohosWindow.create(context, windowId, 1).catch((err) => {
        console.log(msgStr + 'ohosWindow.create 1 once err: ' + JSON.stringify(err));
        unexpectedError(err, caseName, 'ohosWindow.create', done);
      })
      expect(!!ohosData).assertTrue();
      let ohosDataError = await ohosWindow.create(context, windowId, 1).catch((err) => {
        console.log(msgStr + 'ohosWindow.create 1 twice err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(1001)
        done();
      })
      console.log(msgStr + 'ohosWindow.create 1 twice ohosDataError: ' + JSON.stringify(ohosDataError));
    })
  })
}
