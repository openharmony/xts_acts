/*
 * Copyright (c) 2021-2022 Huawei Device Co., Ltd.
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

import usb from '@ohos.usb';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


/* usb core functions test */
export default function UsbCoreJsFunctionsTest() {
describe('UsbCoreJsFunctionsTest', function () {

  var gDeviceList;
  var gPipe;
  var portCurrentMode;

  beforeAll(function () {
    console.log('*************Usb Unit UsbCoreJsFunctionsTest Begin*************');
    var Version = usb.getVersion()
    console.info('begin test getversion :' + Version)
    // version > 17  host currentMode = 2 device currentMode = 1
    var usbPortList = usb.getPorts()
    gDeviceList = usb.getDevices();
    if (usbPortList.length > 0) {
      console.info('usb case gDeviceList.length return: ' + gDeviceList.length);
      if (gDeviceList.length > 0) {
        if (usbPortList[0].status.currentMode == 1) {
          usb.setPortRoles(usbPortList[0].id, usb.SOURCE, usb.HOST).then(data => {
            portCurrentMode = 2
            console.info('usb case setPortRoles return: ' + data);
          }).catch(error => {
            console.info('usb case setPortRoles error : ' + error);
          });
          CheckEmptyUtils.sleep(8000)
          console.log('*************Usb Unit Begin switch to host*************');
        }
      } else {
        portCurrentMode = 1
      }
    }
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test  Case*************');
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test  Case*************');
  })
  afterAll(function () {
    console.log('*************Usb Unit UsbCoreJsFunctionsTest End*************');
  })

  /**
   * @tc.number    : SUB_USB_JS_0480
   * @tc.name      : getDevices
   * @tc.desc      : 获取设备列表
   */
  it('SUB_USB_JS_0480', 0, function () {
    console.info('usb SUB_USB_JS_0480 begin');
    console.info('*****SUB_USB_JS_0480 portcurrentMode**** ret : ' + portCurrentMode)
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    gDeviceList = usb.getDevices();
    if (gDeviceList.length == 0) {
      console.info('usb case get_devices list is null')
      expect(false).assertTrue();
      return
    }
    expect(gDeviceList.length).assertLarger(0);
    console.info('usb case getDevices ret length: ' + gDeviceList.length);
    console.info('usb SUB_USB_JS_0480:  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0710
   * @tc.name      : hasRight
   * @tc.desc      : 权限查询 连接设备 关闭设备
   */
  it('SUB_USB_JS_0710', 0, function () {
    console.info('usb has_right_01 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var hasRight = usb.hasRight(gDeviceList[i].name)
      console.info('usb has_right ret :' + hasRight);
    }

    console.info('usb SUB_USB_JS_0710 :  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0680
   * @tc.name      : requestRight
   * @tc.desc      : 请求权限
   */
  it('SUB_USB_JS_0680', 0, function () {
    console.info('usb SUB_USB_JS_0680 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      usb.requestRight(gDeviceList[i].name).then(hasRight => {
        expect(hasRight).assertTrue();
        console.info('usb request_right ret :' + hasRight);
        console.info('usb SUB_USB_JS_0680 :  PASS');
      }).catch(error => {
        console.info('usb case device request right failed : ' + error + ' :' + gDeviceList[i].name);
        expect(false).assertTrue();
      });
      CheckEmptyUtils.sleep(5000);
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_1080
   * @tc.name      : removeRight
   * @tc.desc      : 移除权限
   */
   it('SUB_USB_JS_1080', 0, function () {
    console.info('usb SUB_USB_JS_1080 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usb.hasRight(gDeviceList[0].name);
    if (!isRight) {
      usb.requestRight(gDeviceList[0].name).then(hasRight => {
        console.info('usb 1080 requestRight hasRight:' + hasRight);
      }).catch(error => {
        console.info('usb 1080 requestRight error:' + error);
      });
      CheckEmptyUtils.sleep(5000);
    }
    var remRight = usb.removeRight(gDeviceList[0].name);
    console.info('usb remove_right ret :' + remRight);
    expect(remRight).assertTrue();
    console.info('usb SUB_USB_JS_1080 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0090
   * @tc.name      : connectDevice
   * @tc.desc      : 打开设备
   */
  it('SUB_USB_JS_0090', 0, function () {
    console.info('usb SUB_USB_JS_0090 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var isRight = usb.hasRight(gDeviceList[0].name);
    if (!isRight) {
      usb.requestRight(gDeviceList[0].name).then(hasRight => {
        console.info('usb 0090 requestRight hasRight:' + hasRight);
      }).catch(error => {
        console.info('usb 0090 requestRight error:' + error);
      });
      CheckEmptyUtils.sleep(5000)
    }

    gPipe = usb.connectDevice(gDeviceList[0])
    console.info('usb case connectDevice ret: ' + JSON.stringify(gPipe));
    expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();

    console.info('usb SUB_USB_JS_0090 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0250
   * @tc.name      : closePipe
   * @tc.desc      : 反向测试 关闭设备 错误 busNum
   */
  it('SUB_USB_JS_0250', 0, function () {
    console.info('usb SUB_USB_JS_0250 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.busNum = -23
    var isPipClose = usb.closePipe(tmpPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();

    console.info('usb SUB_USB_JS_0250 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0260
   * @tc.name      : closePipe
   * @tc.desc      : 反向测试 关闭设备 错误 devAddress
   */
  it('SUB_USB_JS_0260', 0, function () {
    console.info('usb SUB_USB_JS_0260 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.devAddress = -23
    var isPipClose = usb.closePipe(tmpPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();

    console.info('usb SUB_USB_JS_0260 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0270
   * @tc.name      : closePipe
   * @tc.desc      : 反向测试 关闭设备 错误 devAddress busNum
   */
  it('SUB_USB_JS_0270', 0, function () {
    console.info('usb SUB_USB_JS_0270 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.devAddress = -23
    tmpPipe.busNum = -23
    var isPipClose = usb.closePipe(tmpPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();

    console.info('usb SUB_USB_JS_0270 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0240
   * @tc.name      : closePipe
   * @tc.desc      : 关闭设备
   */
  it('SUB_USB_JS_0240', 0, function () {
    console.info('usb SUB_USB_JS_0240 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    console.info('usb case closePipe param: ' + JSON.stringify(gPipe));
    var isPipClose = usb.closePipe(gPipe);
    console.info('usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);

    console.info('usb SUB_USB_JS_0240 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0530
   * @tc.name      : getRawDescriptor
   * @tc.desc      : 获取原始的USB描述符
   */
  it('SUB_USB_JS_0530', 0, function () {
    console.info('usb SUB_USB_JS_0530 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }

    gPipe = usb.connectDevice(gDeviceList[0])
    console.info('usb case getRawDescriptor param: ' + JSON.stringify(gPipe));
    var descriptor = usb.getRawDescriptor(gPipe);
    console.info('usb case getRawDescriptor ret: ' + descriptor);
    expect(true).assertTrue();
    var isPipClose = usb.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);

    console.info('usb SUB_USB_JS_0530 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0490
   * @tc.name      : getFileDescriptor
   * @tc.desc      : 获取文件描述符
   */
  it('SUB_USB_JS_0490', 0, function () {
    console.info('usb SUB_USB_JS_0490 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usb.getFileDescriptor(gPipe);
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    expect(true).assertTrue();
    var isPipClose = usb.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);

    console.info('usb SUB_USB_JS_0490 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0500
   * @tc.name      : getFileDescriptor
   * @tc.desc      : 获取文件描述符,反向测试，错误参数busNum=512
   */
  it('SUB_USB_JS_0500', 0, function () {
    console.info('usb SUB_USB_JS_0500 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    var tempPipe = {busNum : 255, devAddress : 255}
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usb.getFileDescriptor(tempPipe);
    expect(fileDescriptor < 0).assertTrue();
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    var isPipClose = usb.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_JS_0500 :  PASS');
  })

   /**
    * @tc.number    : SUB_USB_JS_0510
    * @tc.name      : getFileDescriptor
    * @tc.desc      : 获取文件描述符,反向测试，错误参数devAddress=512
    */
  it('SUB_USB_JS_0510', 0, function () {
    console.info('usb get_file_descriptor_03 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    var tempPipe = {busNum : 255, devAddress : gPipe.devAddress}
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usb.getFileDescriptor(tempPipe);
    expect(fileDescriptor < 0).assertTrue();
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    var isPipClose = usb.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_JS_0510 :  PASS');
  })

  /**
  * @tc.number    : SUB_USB_JS_0520
  * @tc.name      : getFileDescriptor
  * @tc.desc      : 获取文件描述符,反向测试，错误参数busNum=512，devAddress=512
  */
  it('SUB_USB_JS_0520', 0, function () {
    console.info('usb get_file_descriptor_04 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    var tempPipe = {busNum : gPipe.busNum, devAddress : 255}
    console.info('usb case getFileDescriptor param: ' + JSON.stringify(gPipe));
    var fileDescriptor = usb.getFileDescriptor(tempPipe);
    expect(fileDescriptor < 0).assertTrue();
    console.info('usb case getFileDescriptor ret: ' + fileDescriptor);
    var isPipClose = usb.closePipe(gPipe);
    expect(isPipClose).assertEqual(0);
    console.info('usb SUB_USB_JS_0520 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_1070
   * @tc.name      : getFileDescriptor
   * @tc.desc      : 反向测试 获取文件描述符 参数类型错误
   */
   it('SUB_USB_JS_1070', 0, function () {
    console.info('usb SUB_USB_JS_1070 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    try {
      var maskCode = usb.getFileDescriptor("invalid");
      console.info('usb 1070 case getFileDescriptor return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1070 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1070 :  PASS');
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_1230
   * @tc.name      : getFileDescriptor
   * @tc.desc      : 反向测试 获取文件描述符 参数个数错误，必要参数未传入
   */
   it('SUB_USB_JS_1230', 0, function () {
    console.info('usb SUB_USB_JS_1230 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue();
      return
    }
    gPipe = usb.connectDevice(gDeviceList[0])
    try {
      var maskCode = usb.getFileDescriptor();
      console.info('usb 1230 case getFileDescriptor return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1230 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1230 :  PASS');
    }
  })
})
}
