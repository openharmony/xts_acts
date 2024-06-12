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
import { describe, beforeAll, it, expect } from "@ohos/hypium";
import ohosWindow from '@ohos.window';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';


function expectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function, code: number) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  if (error.code == code) {
    expect(TRUE_FLAG).assertTrue();
  }
  done();
}

function unexpectedError(TRUE_FLAG: boolean, error: BusinessError, caseName: string, apiName: string, done: Function) {
  let msgStr: string = 'jsUnittest ' + caseName + ' ' + apiName + ' failed, err: ';
  console.log(msgStr + JSON.stringify(error));
  expect(TRUE_FLAG).assertFail();
  done();
}

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise < string > (resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

export default function windowPromiseTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage, abilityStorage: LocalStorage) {
  console.log('windowTest context: ' + JSON.stringify(context))
  console.log('windowTest abilityStorage: ' + JSON.stringify(abilityStorage))
  describe('windowPromise_test', () => {
    console.log('describe window_api_test start!!!')
    const TRUE_FLAG: boolean = true;
    let commonRGBColorArr: Array<string> = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)', 'rgb(102,102,102)', 'rgb(255,247,0)'];
    let commonNUMBERColorArr: Array<string> = ['#00FF0000', '#0000FF00', '#000000FF', '#00FFFFFF', '#00000000', '#00F900E6', '#00666666', '#00FFF700'];
    let commonKEYColorArr: Array<string> = ['red', 'green', 'blue', 'white', 'black', 'pink', 'grey', 'yellow'];
    let systemWindowTypeArr: Array<string> = [];
    let systemWindowTypeDicArr: Array<string> = [];
    let systemWindowTypeDic: Record<string, number> = {
      'TYPE_FLOAT': 8,
    }
    let currentDeviceIsRk = false;
    let currentDeviceIsPC = false;
    beforeAll(() => {
      let deviceTypeInfo = deviceInfo.deviceType
      currentDeviceIsRk = deviceTypeInfo === 'default' ? true : false;
      currentDeviceIsPC = deviceTypeInfo === '2in1' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);
      console.log('jsunittest beforeall ohosWindow.WindowType=' + JSON.stringify(ohosWindow.WindowType.TYPE_FLOAT));
      systemWindowTypeDicArr = Object.keys(systemWindowTypeDic);
      console.log('jsUnittest beforeAll systemWindowTypeDicArr=' + JSON.stringify(systemWindowTypeDicArr) + '   ,length=' + systemWindowTypeDicArr.length);
      systemWindowTypeArr = Object.keys(systemWindowTypeDic);
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0100
     * @tc.name      : testsetSubWindowModal_Function_Promise1
     * @tc.desc      : Test the function value of setSubWindowModal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testsetSubWindowModal_Function_Promise1", 0, async function (done) {
      let msgStr = "testsetSubWindowModal_Function_Promise1 ";
      console.log(msgStr + " begin");
      try {
        console.log(msgStr + " try begin")
        let options: ohosWindow.SubWindowOptions = {
          title: 'title',
          decorEnabled: true
        };
        let promise = windowStage.createSubWindowWithOptions('mySubWindow1', options);
        promise.then((data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          data.setSubWindowModal(true).then(() => {
            console.info(msgStr + 'Succeeded in setting subwindow modal true');
            expect(true).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
            expect().assertFail()
            done()
          })
        }).catch((error) => {
          console.log(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('Failed to create the subwindow. Cause: ' + JSON.stringify(error));
        if (error.code == 1300002) {
          expect().assertTrue();
          done();
        } else {
          expect.assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0100
     * @tc.name      : testsetSubWindowModal_Function_Promise2
     * @tc.desc      : Test the function value of setSubWindowModal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testsetSubWindowModal_Function_Promise2", 0, async function (done) {
      let msgStr = "testsetSubWindowModal_Function_Promise2 ";
      console.log(msgStr + " begin");
      try {
        console.log(msgStr + " try begin")
        let options: ohosWindow.SubWindowOptions = {
          title: 'title2',
          decorEnabled: true
        };
        let promise = windowStage.createSubWindowWithOptions('mySubWindow2', options);
        promise.then((data) => {
          console.info(msgStr + 'Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          data.setSubWindowModal(false).then(() => {
            console.info(msgStr + 'Succeeded in setting subwindow modal true');
            expect(true).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
            expect().assertFail()
            done()
          })
        }).catch((error) => {
          console.log(msgStr + 'Failed to create the subwindow. Cause: ' + JSON.stringify(error));
          if (error.code == 1300002) {
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        console.log('Failed to create the subwindow. Cause: ' + JSON.stringify(error));
        if (error.code == 1300002) {
          expect().assertTrue();
          done();
        } else {
          expect.assertFail();
          done();
        }
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0100
     * @tc.name      : testsetSubWindowModal_Function_Promise3
     * @tc.desc      : Test the function value of setSubWindowModal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testsetSubWindowModal_Function_Promise3", 0, async function (done) {
      let msgStr = "testsetSubWindowModal_Function_Promise3 ";
      console.log(msgStr + " begin");
      ohosWindow.getLastWindow(context).then(wnd => {
        console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
        expect(wnd != null).assertTrue();
        try {
          wnd.setSubWindowModal(true).then(() => {
            console.info(msgStr + 'Succeeded in setting subwindow modal');
            expect().assertFail()
          }).catch((err: BusinessError) => {
            console.error(msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
            expect(err.code == 1300004).assertTrue()
            done()
          })
        } catch (exception) {
          console.error(msgStr + ' Failed to setSubWindowModal. Cause: ' + JSON.stringify(exception));
          expect().assertFail()
          done()
        }
      })
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0010
     * @tc.name      : testSetDefaultDensityEnabled_true
     * @tc.desc      : Test the function value of setDefaultDensityEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetDefaultDensityEnabled_true", 0, async function (done) {
      let msgStr = "testSetDefaultDensityEnabled_true";
      console.log(msgStr + "begin");
      try {
        windowStage.setDefaultDensityEnabled(true);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('Failed to set default density enabled. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0020
     * @tc.name      : testSetDefaultDensityEnabled_true
     * @tc.desc      : Test the function value of setDefaultDensityEnabled
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testSetDefaultDensityEnabled_false", 0, async function (done) {
      let msgStr = "testSetDefaultDensityEnabled_false";
      console.log(msgStr + "begin");
      try {
        windowStage.setDefaultDensityEnabled(false);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log('Failed to set default density enabled. Cause:' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0030
     * @tc.name      : testRectChangeOptions_on
     * @tc.desc      : Test the function value of testRectChangeOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeOptions_on", 0, async function (done) {
      let msgStr = "testRectChangeOptions_on";
      console.log(msgStr + "begin");
      try {
        let windowClass: ohosWindow.Window = await ohosWindow.getLastWindow(context);
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        }
        let reason: ohosWindow.RectChangeReason;
        windowClass.on('windowRectChange', (data: ohosWindow.RectChangeOptions) => {
          console.log(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          expect(true).assertTrue();
          done();
        });
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0040
     * @tc.name      : testRectChangeOptions_off
     * @tc.desc      : Test the function value of testRectChangeOptions
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeOptions_off", 0, async function (done) {
      let msgStr = "testRectChangeOptions_off";
      console.log(msgStr + "begin");
      try {
        let windowClass: ohosWindow.Window = await ohosWindow.getLastWindow(context);
        let rect: ohosWindow.Rect = {
          left: 10,
          top: 10,
          width: 10,
          height: 10
        }
        let reason: ohosWindow.RectChangeReason;
        windowClass.off('windowRectChange');
        console.log(msgStr + 'Succeeded window rect changes');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0050
     * @tc.name      : testRectChangeReason_enum
     * @tc.desc      : Test the function value of RectChangeReason
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it("testRectChangeReason_enum", 0, async function (done) {
      let msgStr = "testRectChangeReason_enum";
      console.log(msgStr + "begin");
      try {
        expect(0).assertEqual(ohosWindow.RectChangeReason.UNDEFINED);
        console.log(`ohosWindow.RectChangeReason.UNDEFINED: ${ohosWindow.RectChangeReason.UNDEFINED}`);
        expect(1).assertEqual(ohosWindow.RectChangeReason.MAXIMIZE);
        console.log(`ohosWindow.RectChangeReason.MAXIMIZE: ${ohosWindow.RectChangeReason.MAXIMIZE}`);
        expect(2).assertEqual(ohosWindow.RectChangeReason.RECOVER);
        console.log(`ohosWindow.RectChangeReason.RECOVER: ${ohosWindow.RectChangeReason.RECOVER}`);
        expect(3).assertEqual(ohosWindow.RectChangeReason.MOVE);
        console.log(`ohosWindow.RectChangeReason.MOVE: ${ohosWindow.RectChangeReason.MOVE}`);
        expect(4).assertEqual(ohosWindow.RectChangeReason.DRAG);
        console.log(`ohosWindow.RectChangeReason.DRAG: ${ohosWindow.RectChangeReason.DRAG}`);
        expect(5).assertEqual(ohosWindow.RectChangeReason.DRAG_START);
        console.log(`ohosWindow.RectChangeReason.DRAG_START: ${ohosWindow.RectChangeReason.DRAG_START}`);
        expect(6).assertEqual(ohosWindow.RectChangeReason.DRAG_END);
        console.log(`ohosWindow.RectChangeReason.DRAG_END: ${ohosWindow.RectChangeReason.DRAG_END}`);
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to testRectChangeReason_enum' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0100
         * @tc.name      : test_setWindowGrayScale_0
         * @tc.desc      : test_setWindowGrayScale_0
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_0", 0, async function (done) {
      let msgStr = "test_setWindowGrayScale_0";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        let grayScale = 0;
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 0.');
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code));
        expect().assertFail();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0200
         * @tc.name      : test_setWindowGrayScale_0.5
         * @tc.desc      : test_setWindowGrayScale_0.5
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_0.5", 0, async function (done) {
      let msgStr = "test_setWindowGrayScale_0.5";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = 0.5;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 0.5.');
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0300
         * @tc.name      : test_setWindowGrayScale_1
         * @tc.desc      : test_setWindowGrayScale_1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_1", 0, async function (done) {
      let msgStr = "test_setWindowGrayScale_1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = 1;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 1.');
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0400
         * @tc.name      : test_setWindowGrayScale_-1
         * @tc.desc      : test_setWindowGrayScale_-1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_-1", 0, async function (done) {
      let msgStr = "test_setWindowGrayScale_-1";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = -1;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale -1.');
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code));
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0500
         * @tc.name      : test_setWindowGrayScale_2
         * @tc.desc      : test_setWindowGrayScale_2
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_setWindowGrayScale_2", 0, async function (done) {
      let msgStr = "test_setWindowGrayScale_2";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      let grayScale = 2;
      try {
        windowClass.setWindowGrayScale(grayScale).then(() => {
          console.info(msgStr + 'Succeeded in setting the grayScale 2.');
          expect(false).assertTrue();
          done();
        }).catch((err) => {
          console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code));
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0600
         * @tc.name      : test_subWindow_setWindowGrayScale_1
         * @tc.desc      : test_subWindow_setWindowGrayScale_1
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
    it("test_subWindow_setWindowGrayScale_1", 0, async function (done) {
      let msgStr = "test_subWindow_setWindowGrayScale_1";
      console.log(msgStr + "begin");
      let grayScale = 1;
      try {
        await windowStage.createSubWindow('test_subWindow_setWindowGrayScale_1').then(async (data) => {
          let subWindowClass = data;
          console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
          subWindowClass.setUiContent('pages/index/index2');
          await subWindowClass.setWindowGrayScale(grayScale).then(() => {
            console.info(msgStr + 'Succeeded in setting the grayScale 1.');
            expect(true).assertTrue();
            done();
          }).catch((err) => {
            console.error(msgStr + `Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code == 801) {
              console.info(msgStr + '此设备不支持setWindowGrayScale能力.');
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        }).catch((err) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });

      } catch (error) {
        console.log(msgStr + 'Failed to setWindowGrayScale' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })

    /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_ON_WINDOW_RECTCHANGE_0100
         * @tc.name      : test_on_windowRectChange
         * @tc.desc      : test_on_windowRectChange
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 2
         */

    it("test_on_windowRectChange", 2, async function (done) {
      let msgStr = "test_on_windowRectChange";
      console.log(msgStr + "begin");
      let windowClass = await windowStage.getMainWindow();
      try {
        windowClass.on('windowRectChange', (data: window.RectChangeOptions) => {
          console.info(msgStr + 'Succeeded window rect changes. Data: ' + JSON.stringify(data));
          console.info(msgStr + 'Succeeded window rect changes. reason: ' + JSON.stringify(data.reason));
        });
        windowClass.off('windowRectChange');
        console.log(msgStr + 'Succeeded to off the windowRectChange');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.log(msgStr + 'Failed to on_windowRectChange' + JSON.stringify(error.code) + error.message);
        expect(false).assertTrue();
        done();
      }
    })


  })
}
