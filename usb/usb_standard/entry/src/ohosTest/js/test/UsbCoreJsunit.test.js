/*
 * Copyright (c) 2021-2024 Huawei Device Co., Ltd.
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

import usbManager from '@ohos.usbManager';
import { UiDriver, BY } from '@ohos.UiTest';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'


/* usb core functions test */
export default function UsbCoreJsFunctionsTest() {
describe('UsbCoreJsFunctionsTest', function () {

  let gDeviceList;
  let gPipe;
  let devices;
  let isDeviceConnected;
  const TAG = "[UsbCoreJsFunctionsTest]";

  function deviceConnected() {
    if (gDeviceList.length > 0) {
        console.info(TAG, "Test USB device is connected");
        return true;
    }
    console.info(TAG, "Test USB device is not connected");
    return false;
  }

  beforeAll(async function () {
    console.log(TAG, '*************Usb Unit UsbCoreJsFunctionsTest Begin*************');
    var Version = usbManager.getVersion();
    console.info(TAG, 'beforeAll: begin test getversion :' + Version);
    // version > 17  host currentMode = 2 device currentMode = 1
    gDeviceList = usbManager.getDevices();
    console.info(TAG, 'beforeAll: usb case gDeviceList.length return: ' + JSON.stringify(gDeviceList));
    isDeviceConnected = deviceConnected();
    if (isDeviceConnected) {
      let hasRight = usbManager.hasRight(gDeviceList[0].name);
      if (!hasRight) {
        console.info(TAG, `beforeAll: usb requestRight start`);
        await getPermission();
        CheckEmptyUtils.sleep(1000);
        await driveFn();
        CheckEmptyUtils.sleep(1000);
      }
    }
  })

  beforeEach(function () {
    console.info(TAG, 'beforeEach: *************Usb Unit Test  Case*************');
    gDeviceList = usbManager.getDevices();
    if (isDeviceConnected) {
      devices = gDeviceList[0];
      console.info(TAG, 'beforeEach return devices : ' + JSON.stringify(devices));
    }
  })

  afterEach(function () {
    console.info(TAG, 'afterEach: *************Usb Unit Test  Case*************');
    devices = null;
    gPipe = null;
    console.info(TAG, 'afterEach return devices : ' + JSON.stringify(devices));
    console.info(TAG, 'afterEach return devices : ' + JSON.stringify(gPipe));
  })

  afterAll(function () {
    console.log(TAG, '*************Usb Unit UsbCoreJsFunctionsTest End*************');
  })

  async function driveFn() {
    console.info('**************driveFn**************');
    try {
        let driver = await UiDriver.create();
        console.info(TAG, ` come in driveFn`);
        console.info(TAG, `driver is ${JSON.stringify(driver)}`);
        CheckEmptyUtils.sleep(1000);
        let button = await driver.findComponent(BY.text('允许'));
        console.info(TAG, `button is ${JSON.stringify(button)}`);
        CheckEmptyUtils.sleep(1000);
        await button.click();
    } catch (err) {
        console.info(TAG, 'err is ' + err);
        return;
    }
  }

  async function getPermission() {
    console.info('**************getPermission**************');
    try {
      usbManager.requestRight(gDeviceList[0].name).then(hasRight => {
        console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
      })
    } catch (err) {
      console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
      return
    }
  }

  function getPipe(testCaseName) {
    gPipe = usbManager.connectDevice(devices);
    console.info(TAG, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
    expect(gPipe !== null).assertTrue();
  }

  function toClosePipe(testCaseName) {
    let isPipClose = usbManager.closePipe(gPipe);
    console.info(TAG, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
    expect(isPipClose).assertEqual(0);
  }

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_0500
   * @tc.name     : testGetDevices001
   * @tc.desc     : Positive test: Get device list
   * @tc.desc     : 【C-ALL-HARDWARE-0502】必须支持连接标准 USB 外围设备
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetDevices001', 0, function (done) {
    console.info(TAG, 'usb testGetDevices001 begin');
    if (!isDeviceConnected) {
      done();
      return
    }
    gDeviceList = usbManager.getDevices();
    console.info(TAG, 'usb case getDevices ret length: ' + gDeviceList.length);
    expect(gDeviceList.length > 0).assertTrue();
    done();
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_0900
   * @tc.name     : testHasRight001
   * @tc.desc     : Positive test: Permission query
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testHasRight001', 0, function (done) {
    console.info(TAG, 'usb testHasRight001 begin');
    if (!isDeviceConnected) {
      done();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      var hasRight = usbManager.hasRight(gDeviceList[i].name);
      console.info(TAG, 'usb has_right ret :' + hasRight);
      expect(hasRight).assertTrue();
    }
    done();
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_0800
   * @tc.name     : testRequestRight001
   * @tc.desc     : Positive test: Request permission
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testRequestRight001', 0, async function () {
    console.info(TAG, 'usb testRequestRight001 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    for (var i = 0; i < gDeviceList.length; i++) {
      try {
        let hasRight = await usbManager.requestRight(gDeviceList[i].name);
        console.info(TAG, 'usb testRequestRight001 ret :' + hasRight);
        expect(hasRight).assertTrue();
      } catch(error) {
        console.info(TAG, 'usb case device request right failed : ' + error + ' :' + gDeviceList[i].name);
        expect(error !== null).assertFalse();
      }
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_1200
   * @tc.name     : testRemoveRight001
   * @tc.desc     : Positive test: Remove Permissions
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testRemoveRight001', 0, async function () {
    console.info(TAG, 'usb testRemoveRight001 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    let remRight = usbManager.removeRight(devices.name);
    console.info(TAG, 'usb testRemoveRight001 ret :' + remRight);
    expect(remRight).assertTrue();
    await getPermission();
    CheckEmptyUtils.sleep(1000);
    await driveFn();
    CheckEmptyUtils.sleep(1000);
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_0100
   * @tc.name     : testConnectDevice001
   * @tc.desc     : Positive test: open device
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testConnectDevice001', 0, async function () {
    console.info(TAG, 'usb testConnectDevice001 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    gPipe = usbManager.connectDevice(devices);
    console.info(TAG, 'usb case testConnectDevice001 ret: ' + JSON.stringify(gPipe));
    expect(CheckEmptyUtils.isEmpty(gPipe)).assertFalse();
    toClosePipe('testConnectDevice001');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_0300
   * @tc.name     : testClosePipe001
   * @tc.desc     : Positive test: close device
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClosePipe001', 0, function () {
    console.info(TAG, 'usb testClosePipe001 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    getPipe('testClosePipe001');

    let isPipClose = usbManager.closePipe(gPipe);
    console.info(TAG, 'usb case closePipe ret: ' + isPipClose);
    expect(isPipClose).assertEqual(0);
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1300
   * @tc.name     : testClosePipe002
   * @tc.desc     : Negative test: close device, busNum error -23
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClosePipe002', 0, function () {
    console.info(TAG, 'usb testClosePipe002 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    getPipe('testClosePipe002');
    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.busNum = -23;
    console.info(TAG, 'usb case testClosePipe002 param: ' + JSON.stringify(tmpPipe));
    var isPipClose = usbManager.closePipe(tmpPipe);
    console.info(TAG, 'usb case testClosePipe002 ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();
    toClosePipe('testClosePipe002');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1400
   * @tc.name     : testClosePipe003
   * @tc.desc     : Negative test: close device, devAddress error -23
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClosePipe003', 0, function () {
    console.info(TAG, 'usb testClosePipe003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    getPipe('testClosePipe003');
    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.devAddress = -23;
    console.info(TAG, 'usb case testClosePipe003 param: ' + JSON.stringify(tmpPipe));
    var isPipClose = usbManager.closePipe(tmpPipe);
    console.info(TAG, 'usb case testClosePipe003 ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();
    toClosePipe('testClosePipe003');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_1500
   * @tc.name     : testClosePipe004
   * @tc.desc     : Negative test: close device, devAddress && busNum error -23
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testClosePipe004', 0, function () {
    console.info(TAG, 'usb testClosePipe004 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
  
    getPipe('testClosePipe004');
    var tmpPipe = JSON.parse(JSON.stringify(gPipe));
    tmpPipe.devAddress = -23;
    tmpPipe.busNum = -23;
    console.info(TAG, 'usb case testClosePipe004 param: ' + JSON.stringify(tmpPipe));
    var isPipClose = usbManager.closePipe(tmpPipe);
    console.info(TAG, 'usb case testClosePipe004 ret: ' + isPipClose);
    expect(isPipClose == 0).assertFalse();
    toClosePipe('testClosePipe004');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_0700
   * @tc.name     : testGetRawDescriptor001
   * @tc.desc     : Positive test: Get the original USB descriptor
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetRawDescriptor001', 0, function () {
    console.info(TAG, 'usb testGetRawDescriptor001 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    getPipe('testGetRawDescriptor001');
    var descriptor = usbManager.getRawDescriptor(gPipe);
    console.info(TAG, 'usb case testGetRawDescriptor001 ret: ' + JSON.stringify(descriptor));
    expect(descriptor.length).assertLarger(0);
    toClosePipe('testGetRawDescriptor001');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Func_0600
   * @tc.name     : testGetFileDescriptor001
   * @tc.desc     : Positive test: Get file descriptor
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetFileDescriptor001', 0, function () {
    console.info(TAG, 'usb testGetFileDescriptor001 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    getPipe('testGetFileDescriptor001');
    var fileDescriptor = usbManager.getFileDescriptor(gPipe);
    console.info(TAG, 'usb case testGetFileDescriptor001 ret: ' + fileDescriptor);
    expect(fileDescriptor >= 0).assertTrue();
    toClosePipe('testGetFileDescriptor001');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_2900
   * @tc.name     : testGetFileDescriptor002
   * @tc.desc     : Negative test: Get file descriptor, error busNum=255 devAddress=255
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetFileDescriptor002', 0, function () {
    console.info(TAG, 'usb testGetFileDescriptor002 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    getPipe('testGetFileDescriptor002');
    var tempPipe = {busNum : 255, devAddress : 255};
    console.info(TAG, 'usb case testGetFileDescriptor002 param: ' + JSON.stringify(tempPipe));
    var fileDescriptor = usbManager.getFileDescriptor(tempPipe);
    console.info(TAG, 'usb case testGetFileDescriptor002 ret: ' + fileDescriptor);
    expect(fileDescriptor).assertEqual(-1);
    toClosePipe('testGetFileDescriptor002');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3000
   * @tc.name     : testGetFileDescriptor003
   * @tc.desc     : Negative test: Get file descriptor,error busNum=255
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetFileDescriptor003', 0, function () {
    console.info(TAG, 'usb testGetFileDescriptor003 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }

    getPipe('testGetFileDescriptor003');
    var tempPipe = {busNum : 255, devAddress : gPipe.devAddress};
    console.info(TAG, 'usb case testGetFileDescriptor003 param: ' + JSON.stringify(tempPipe));
    var fileDescriptor = usbManager.getFileDescriptor(tempPipe);
    console.info(TAG, 'usb case testGetFileDescriptor003 ret: ' + fileDescriptor);
    expect(fileDescriptor).assertEqual(-1);
    toClosePipe('testGetFileDescriptor003');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_Compatibility_3100
   * @tc.name     : testGetFileDescriptor004
   * @tc.desc     : Negative test: Get file descriptor,error devAddress=255
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetFileDescriptor004', 0, function () {
    console.info(TAG, 'usb testGetFileDescriptor004 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    getPipe('testGetFileDescriptor004');
    var tempPipe = {busNum : gPipe.busNum, devAddress : 255};
    console.info(TAG, 'usb case testGetFileDescriptor004 param: ' + JSON.stringify(tempPipe));
    var fileDescriptor = usbManager.getFileDescriptor(tempPipe);
    expect(fileDescriptor).assertEqual(-1);
    console.info(TAG, 'usb case testGetFileDescriptor004 ret: ' + fileDescriptor);
    toClosePipe('testGetFileDescriptor004');
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_0700
   * @tc.name     : testGetFileDescriptor005
   * @tc.desc     : Negative test: Get file descriptor, parameter type error "invalid"
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetFileDescriptor005', 0, function () {
    console.info(TAG, 'usb testGetFileDescriptor005 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    try {
      var maskCode = usbManager.getFileDescriptor("invalid");
      console.info(TAG, 'usb testGetFileDescriptor005 case getFileDescriptor return: ' + maskCode);
      expect(maskCode !== null).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testGetFileDescriptor005 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

  /**
   * @tc.number   : SUB_USB_HostManager_JS_ErrCode_1600
   * @tc.name     : testGetFileDescriptor006
   * @tc.desc     : Negative test: Get file descriptor, parameter number exception, necessary parameters not input
   * @tc.size     : MediumTest
   * @tc.type     : Function
   * @tc.level    : Level 2
   */
  it('testGetFileDescriptor006', 0, function () {
    console.info(TAG, 'usb testGetFileDescriptor006 begin');
    if (!isDeviceConnected) {
      expect(isDeviceConnected).assertFalse();
      return
    }
    
    try {
      var maskCode = usbManager.getFileDescriptor();
      console.info(TAG, 'usb testGetFileDescriptor006 case getFileDescriptor return: ' + maskCode);
      expect(maskCode !== null).assertFalse();
    } catch (err) {
      console.info(TAG, 'usb testGetFileDescriptor006 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
    }
  })

})
}
