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

import inputDevice from '@ohos.multimodalInput.inputDevice';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
export default function MultimodalInput_Device_test() {
describe('MultimodalInput_Device_test', function () {

  // 参数正确,返回一个数组
  it('inputDevice::getDeviceIds_test-01', 0, function () {
    console.info(`inputDevice::getDeviceIds_test-01 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        expect(data).assertInstanceOf('Array');
      }
      console.info(`inputDevice::getDeviceIds_test-01 exit`);
    })
  })

  // 参数正确,判断一种或多种设备
  it("inputDevice::getDeviceIds_test-02", 0, function () {
    console.info(`inputDevice::getDeviceIds_test-02 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        expect(data.length > 0).assertTrue();
      }
      console.info(`inputDevice::getDeviceIds_test-02 exit`);
    })
  })

  // 参数类型错误
  it("inputDevice::getDeviceIds_test-03", 0, function () {
    console.info(`inputDevice::getDeviceIds_test-03 enter`);
    try {
      inputDevice.getDeviceIds(-1);
    } catch (error) {
      expect(error.message).assertEqual("GetDeviceIds: \"The first parameter type is wrong\"");
    }
    console.info(`inputDevice::getDeviceIds_test-03 exit`);
  })

  // 参数数量错误
  it("inputDevice::getDeviceIds_test-04", 0, function () {
    console.info(`inputDevice::getDeviceIds_test-04 enter`);
    try {
      inputDevice.getDeviceIds(-1, (data) => {
        console.info(data);
      });
    } catch (error) {
      expect(error.message).assertEqual("GetDeviceIds: \"too many parameters\"");
    }
    console.info(`inputDevice::getDeviceIds_test-04 exit`);
  })

  // 无效的设备id
  it("inputDevice::getDevice_test-01", 0, function () {
    console.info(`inputDevice::getDevice_test-01 enter`);
    inputDevice.getDevice(-1, (data, err) => {
      if (err) {
        expect(false).assertTrue();
        console.info(`inputDevice::getDevice_test-01 ${JSON.stringify(err)}`);
      } else {
        expect(JSON.stringify(data) !== "{}").assertTrue();
      }
      console.info(`inputDevice::getDevice_test-01 exit`);
    })
  })

  // 参数正常,返回值正常
  it("inputDevice::getDevice_test-02", 0, function () {
    console.info(`inputDevice::getDevice_test-02 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        let arr = [];
        for (let i = 0; i < data.length; i++) {
          inputDevice.getDevice(data[i], (res, err) => {
            console.info(`getDevice:data ${JSON.stringify(data)}`);
            arr = Object.keys(res);
            expect(res.id).assertInstanceOf('Number');
            expect(res.name).assertInstanceOf('String');
            expect(res.sources).assertInstanceOf('Array');
            expect(res.axisRanges).assertInstanceOf('Array');
            expect(res.bus).assertInstanceOf('Number');
            expect(res.product).assertInstanceOf('Number');
            expect(res.vendor).assertInstanceOf('Number');
            expect(res.version).assertInstanceOf('Number');
            expect(res.phys).assertInstanceOf('String');
            expect(res.uniq).assertInstanceOf('String');
            expect(res).assertInstanceOf('Object');
            for(let j = 0;j < res.axisRanges.length; j++ ){
              expect(res.axisRanges[j].source == 'keyboard' || res.axisRanges[j].source == 'mouse'
              || res.axisRanges[j].source == 'touchpad' || res.axisRanges[j].source == 'touchscreen'
              || res.axisRanges[j].source == 'joystick' || res.axisRanges[j].source == 'trackball').assertTrue();
              expect(res.axisRanges[j].axis == 'touchMajor' || res.axisRanges[j].axis == 'touchMinor'
              || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
              || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
              || res.axisRanges[j].axis == 'toolMinor' || res.axisRanges[j].axis == 'touchMajor'
              || res.axisRanges[j].axis == 'NULL').assertTrue();
              expect(res.axisRanges[j].max).assertInstanceOf('Number');
              expect(res.axisRanges[j]).assertInstanceOf('AxisRange');
              expect(res.axisRanges[j].min).assertInstanceOf('Number');
              expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
              expect(res.axisRanges[j].flat).assertInstanceOf('Number');
              expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
            }
          })
        }
      }
      console.info(`inputDevice::getDevice_test-02 exit`);
    });
  })

  // 参数正常,返回值正常
  it("inputDevice::supportKeys_test-01", 0, function () {
    console.info(`inputDevice::supportKeys_test-01 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        for (let i = 0; i < data.length; ++i) {
          inputDevice.supportKeys(data[i], [17, 22, 2055], (res, err) => {
            expect(res).assertInstanceOf('Array');
          });
        }
      }
      console.info(`inputDevice::supportKeys_test-01 exit`);
    });
  })

  // 第二个参数异常
  it("inputDevice::supportKeys_test-02", 0, function () {
    console.info(`inputDevice::supportKeys_test-02 enter`);
    try {
      inputDevice.supportKeys(0, 2022, (res) => {
        console.info(res);
      });
    } catch (error) {
      expect(error.message).assertEqual("Parameter error. The type of keys must be array.");
    }
    console.info(`inputDevice::supportKeys_test-02 exit`);
  })

  // 参数正常
  it("inputDevice::getKeyboardType_test-01", 0, function () {
    console.info(`inputDevice::getKeyboardType_test-01 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        for (let i = 0; i < data.length; ++i) {
          inputDevice.getKeyboardType(data[i], (res, err) => {
            expect(res).assertInstanceOf('Number');
          });
        }
      }
      console.info(`inputDevice::getKeyboardType_test-01 exit`);
    });
  })

  //参数异常
  it("inputDevice::getKeyboardType_test-02", 0, function () {
    console.info(`inputDevice::getKeyboardType_test-02 enter`);
    try {
      inputDevice.getKeyboardType(-1);
    } catch (error) {
      expect(error.message).assertEqual("Invalid input device id");
    }
    console.info(`inputDevice::getKeyboardType_test-02 exit`);
  });

  // 参数正常
  it("inputDevice::getKeyboardType_test-03", 0, function () {
    console.info(`inputDevice::getKeyboardType_test-03 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        for (let i = 0; i < data.length; ++i) {
          inputDevice.getKeyboardType(data[i]).then((res) => {
            expect(res).assertInstanceOf('Number');
          });
        }
      }
      console.info(`inputDevice::getKeyboardType_test-03 exit`);
    });
  })

  /**
   * @tc.number MultimodalInputDevice_js_0010
   * @tc.name MultimodalInputDevice_KeyboardType_NONE_test
   * @tc.desc inputDevice.KeyboardType.NONE test
   */
  it('MultimodalInputDevice_KeyboardType_NONE_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_NONE_test = ' + inputDevice.KeyboardType.NONE);
    expect(inputDevice.KeyboardType.NONE == 0).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0020
   * @tc.name MultimodalInputDevice_KeyboardType_UNKNOWN_test
   * @tc.desc inputDevice.KeyboardType.UNKNOWN test
   */
  it('MultimodalInputDevice_KeyboardType_UNKNOWN_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_UNKNOWN_test = ' + inputDevice.KeyboardType.UNKNOWN);
    expect(inputDevice.KeyboardType.UNKNOWN == 1).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0030
   * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test
   * @tc.desc inputDevice.KeyboardType.ALPHABETIC_KEYBOARD test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test = '
      + inputDevice.KeyboardType.ALPHABETIC_KEYBOARD);
    expect(inputDevice.KeyboardType.ALPHABETIC_KEYBOARD == 2).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0040
   * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test
   * @tc.desc inputDevice.KeyboardType.DIGITAL_KEYBOARD test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test = '
      + inputDevice.KeyboardType.DIGITAL_KEYBOARD);
    expect(inputDevice.KeyboardType.DIGITAL_KEYBOARD == 3).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0050
   * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test
   * @tc.desc inputDevice.KeyboardType.HANDWRITING_PEN test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test = '
      + inputDevice.KeyboardType.HANDWRITING_PEN);
    expect(inputDevice.KeyboardType.HANDWRITING_PEN == 4).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0060
   * @tc.name MultimodalInputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test
   * @tc.desc inputDevice.KeyboardType.REMOTE_CONTROL test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test = '
      + inputDevice.KeyboardType.REMOTE_CONTROL);
    expect(inputDevice.KeyboardType.REMOTE_CONTROL == 5).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0070
   * @tc.name MultimodalInputDevice_getDeviceIds_Promise_test
   * @tc.desc inputdevice interface getDeviceIds & supportKeys test
   */
  it("MultimodalInputDevice_getDeviceIds_Promise_test", 0, async function (done) {
    console.info(`MultimodalInputDevice_getDeviceIds_Promise_test enter`);
    inputDevice.getDeviceIds().then((data, err) => {
      if (err) {
        console.info(`MultimodalInputDevice_getDeviceIds_Promise_test err`);
        expect(false).assertTrue();
        done();
      } else {
        console.info(`MultimodalInputDevice_getDeviceIds_Promise_test data`);
        for (let i = 0; i < data.length; ++i) {
          inputDevice.supportKeys(data[i], [17, 22, 2055]).then((res, err) => {
            expect(res).assertInstanceOf('Array');
          });
        }
        done();
      }
      console.info(`MultimodalInputDevice_getDeviceIds_Promise_test exit`);
    });
  })

  /**
   * @tc.number MultimodalInputDevice_js_0080
   * @tc.name MultimodalInputDevice_getDevice_Promise_test
   * @tc.desc inputdevice interface getDevice test
   */
  it("MultimodalInputDevice_getDevice_Promise_test", 0, function () {
    console.info(`MultimodalInputDevice_getDevice_Promise_test enter`);
    inputDevice.getDevice(-1).then((data, err) => {
      if (err) {
        console.info(`MultimodalInputDevice_getDevice_Promise_test err`);
        expect(false).assertTrue();
        console.info(`MultimodalInputDevice_getDevice_Promise_test ${JSON.stringify(err)}`);
      } else {
        console.info(`MultimodalInputDevice_getDevice_Promise_test data`);
        expect(JSON.stringify(data) !== "{}").assertTrue();
      }
      console.info(`MultimodalInputDevice_getDevice_Promise_test exit`);
    });
  })

  /**
   * @tc.number MultimodalInputDevice_js_0090
   * @tc.name MultimodalInputDevice_on_test
   * @tc.desc inputdevice interface getDevice test
   */
  it("MultimodalInputDevice_on_test", 0, function () {
    console.info(`MultimodalInputDevice_on_test enter`);
    let isPhysicalKeyboardExist = true;
    inputDevice.on("change", (data) => {
      console.info("type: " + data.type + ", deviceId: " + data.deviceId);
      inputDevice.getKeyboardType(data.deviceId, (err, ret) => {
        console.info("The keyboard type of the device is: " + ret);
        if (ret == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD && data.type == 'add') {
          // 监听物理键盘已连接。
          isPhysicalKeyboardExist = true;
        } else if (ret == inputDevice.KeyboardType.ALPHABETIC_KEYBOARD && data.type == 'remove') {
          // 监听物理键盘已断开。
          isPhysicalKeyboardExist = false;
        }
      });
    });
    console.info(`MultimodalInputDevice_on_test exit`);
  })

  /**
   * @tc.number MultimodalInputDevice_js_0100
   * @tc.name MultimodalInputDevice_off_test
   * @tc.desc inputdevice interface getDevice test
   */
  it("MultimodalInputDevice_off_test", 0, function () {
    console.info(`MultimodalInputDevice_off_test enter`);
    function listener(data) {
      console.info("type: " + data.type + ", deviceId: " + data.deviceId);
      expect(data.type== 'add' || data.type== 'remove').assertTrue();
      expect(data).assertInstanceOf('DeviceListener');
    }
    // 单独取消listener的监听。
    inputDevice.off("change", listener);
    console.info(`MultimodalInputDevice_off_test exit`);
  })

  /**
   * @tc.number MultimodalInputDevice_js_0110
   * @tc.name MultimodalInputDevice_GetDeviceList_test
   * @tc.desc inputdevice interface getDeviceList test
   */
  it('inputDevice::getDeviceList_test-01', 0, function () {
    console.info(`inputDevice::getDeviceList_async_test enter`);
    try {
      inputDevice.getDeviceList((err, data) => {
        if (err) {
          expect(false).assertTrue();
        } else {
          expect(data).assertInstanceOf('Array');
        }
        console.info(`inputDevice::getDeviceList_async_test exit`);
      })
    } catch (err) {
      expect(false).assertTrue();
    }

  })

  /**
   * @tc.number MultimodalInputDevice_js_0120
   * @tc.name MultimodalInputDevice_GetDeviceList_test
   * @tc.desc inputdevice interface getDeviceList test
   */
  it('inputDevice::getDeviceList_test-02', 0, function () {
    console.info(`inputDevice::getDeviceList_promise_test enter`);
    try {
      inputDevice.getDeviceList().then(data => {
        expect(data).assertInstanceOf('Array');
      }).catch(error => {
        expect(false).assertTrue();
      });
    } catch (err) {
      expect(false).assertTrue();
    }
    console.info(`inputDevice::getDeviceList_promise_test exit`);
  })

  /**
   * @tc.number MultimodalInputDevice_js_0130
   * @tc.name MultimodalInputDevice_GetDeviceInfo_test
   * @tc.desc inputdevice interface getDeviceInfo test
   */
  it('inputDevice::getDeviceInfo_test-01', 0, function () {
    console.info(`inputDevice::getDeviceInfo_async_test enter`);
    try {
      inputDevice.getDeviceList().then((data) => {
        expect(data).assertInstanceOf('Array');
        if (data.length() <= 0) {
          return;
        }
        try {
          inputDevice.getDeviceInfo(data[0], (err, res) => {
            if (err) {
              expect(false).assertTrue();
              return;
            }
            let arr = [];
            console.info(`getDeviceInfo:data ${JSON.stringify(res)}`);
            arr = Object.keys(res);
            expect(res.id).assertInstanceOf('Number');
            expect(res.name).assertInstanceOf('String');
            expect(res.sources).assertInstanceOf('Array');
            expect(res.axisRanges).assertInstanceOf('Array');
            expect(res.bus).assertInstanceOf('Number');
            expect(res.product).assertInstanceOf('Number');
            expect(res.vendor).assertInstanceOf('Number');
            expect(res.version).assertInstanceOf('Number');
            expect(res.phys).assertInstanceOf('String');
            expect(res.uniq).assertInstanceOf('String');
            expect(res).assertInstanceOf('Object');
            for(let j = 0;j < res.axisRanges.length; j++ ){
              expect(res.axisRanges[j].source == 'keyboard' || res.axisRanges[j].source == 'mouse'
              || res.axisRanges[j].source == 'touchpad' || res.axisRanges[j].source == 'touchscreen'
              || res.axisRanges[j].source == 'joystick' || res.axisRanges[j].source == 'trackball').assertTrue();
              expect(res.axisRanges[j].axis == 'touchMajor' || res.axisRanges[j].axis == 'touchMinor'
              || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
              || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
              || res.axisRanges[j].axis == 'toolMinor' || res.axisRanges[j].axis == 'touchMajor'
              || res.axisRanges[j].axis == 'NULL').assertTrue();
              expect(res.axisRanges[j].max).assertInstanceOf('Number');
              expect(res.axisRanges[j]).assertInstanceOf('AxisRange');
              expect(res.axisRanges[j].min).assertInstanceOf('Number');
              expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
              expect(res.axisRanges[j].flat).assertInstanceOf('Number');
              expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
            }
          })
        } catch (err) {
          expect(false).assertTrue();
        }
      })
    } catch (err) {
      expect(false).assertTrue();
    }
    console.info(`inputDevice::getDeviceInfo_async_test exit`);
  })

  /**
   * @tc.number MultimodalInputDevice_js_0140
   * @tc.name MultimodalInputDevice_GetDeviceInfo_test
   * @tc.desc inputdevice interface getDeviceInfo test
   */
   it('inputDevice::getDeviceInfo_test-02', 0, function () {
    console.info(`inputDevice::getDeviceInfo_promise_test enter`);
    try {
      inputDevice.getDeviceList().then((data) => {
        expect(data).assertInstanceOf('Array');
        if (data.length() <= 0) {
          return;
        }
        try {
          inputDevice.getDeviceInfo(data[0]).then((res) => {
            let arr = [];
            console.info(`getDeviceInfo:data ${JSON.stringify(res)}`);
            arr = Object.keys(res);
            expect(res.id).assertInstanceOf('Number');
            expect(res.name).assertInstanceOf('String');
            expect(res.sources).assertInstanceOf('Array');
            expect(res.axisRanges).assertInstanceOf('Array');
            expect(res.bus).assertInstanceOf('Number');
            expect(res.product).assertInstanceOf('Number');
            expect(res.vendor).assertInstanceOf('Number');
            expect(res.version).assertInstanceOf('Number');
            expect(res.phys).assertInstanceOf('String');
            expect(res.uniq).assertInstanceOf('String');
            expect(res).assertInstanceOf('Object');
            for(let j = 0;j < res.axisRanges.length; j++ ){
              expect(res.axisRanges[j].source == 'keyboard' || res.axisRanges[j].source == 'mouse'
              || res.axisRanges[j].source == 'touchpad' || res.axisRanges[j].source == 'touchscreen'
              || res.axisRanges[j].source == 'joystick' || res.axisRanges[j].source == 'trackball').assertTrue();
              expect(res.axisRanges[j].axis == 'touchMajor' || res.axisRanges[j].axis == 'touchMinor'
              || res.axisRanges[j].axis == 'orientation' || res.axisRanges[j].axis == 'x'
              || res.axisRanges[j].axis == 'y' || res.axisRanges[j].axis == 'pressure'
              || res.axisRanges[j].axis == 'toolMinor' || res.axisRanges[j].axis == 'touchMajor'
              || res.axisRanges[j].axis == 'NULL').assertTrue();
              expect(res.axisRanges[j].max).assertInstanceOf('Number');
              expect(res.axisRanges[j]).assertInstanceOf('AxisRange');
              expect(res.axisRanges[j].min).assertInstanceOf('Number');
              expect(res.axisRanges[j].fuzz).assertInstanceOf('Number');
              expect(res.axisRanges[j].flat).assertInstanceOf('Number');
              expect(res.axisRanges[j].resolution).assertInstanceOf('Number');
            }
          }).catch(err => {
            expect(false).assertTrue();
          });
        } catch (err) {
          expect(false).assertTrue();
        }
      })
    } catch (err) {
      expect(false).assertTrue();
    }
    console.info(`inputDevice::getDeviceInfo_promise_test exit`);
  })
})
}
