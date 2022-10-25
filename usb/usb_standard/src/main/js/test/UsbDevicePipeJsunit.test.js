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
import EventConstants from './EventConstants.js';
import parameter from '@ohos.systemparameter';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

/* usb device pipe test */
export default function UsbDevicePipeJsFunctionsTest() {
describe('UsbDevicePipeJsFunctionsTest', function () {

  var gDeviceList
  var gPipe
  var portCurrentMode

  beforeAll(function () {
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTest Begin*************');
    var Version = usb.getVersion()
    console.info('usb unit begin test getversion :' + Version)
    // version > 17  host currentMode = 2 device currentMode = 1
    var usbPortList = usb.getPorts()
    gDeviceList = usb.getDevices();
    if (usbPortList.length > 0) {
      if (gDeviceList.length > 0) {
        if (usbPortList[0].status.currentMode == 1) {
          usb.setPortRoles(usbPortList[0].id, usb.SOURCE, usb.HOST).then(data => {
            portCurrentMode = 2
            console.info('usb case setPortRoles return: ' + data);
          }).catch(error => {
            console.info('usb case setPortRoles error : ' + error);
          });
          CheckEmptyUtils.sleep(8000)
          console.log('*************Usb Unit switch to host Begin*************');
        }
      } else {
        portCurrentMode = 1
      }
    }

    gPipe = usb.connectDevice(gDeviceList[0])
    console.info('usb unit connectDevice gPipe ret : ' + JSON.stringify(gPipe));
  })

  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Case*************');
  })
  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Case*************');
  })

  afterAll(function () {
    var isPipClose = usb.closePipe(gPipe)
    console.info('usb unit close gPipe ret : ' + isPipClose);
    console.log('*************Usb Unit UsbDevicePipeJsFunctionsTest End*************');
  })

  function findInitPoint(testParam, j) {
    var bfind = false
    for (var k = 0; k < testParam.config.interfaces[j].endpoints.length; k++) {
      var endpoint = testParam.config.interfaces[j].endpoints[k];
      if (endpoint.type == EventConstants.USB_ENDPOINT_XFER_BULK) {
        bfind = true
        if (endpoint.direction == usb.USB_REQUEST_DIR_TO_DEVICE) {
          testParam.maxOutSize = endpoint.maxPacketSize;
          testParam.outEndpoint = endpoint;
        } else if (endpoint.direction == (usb.USB_REQUEST_DIR_FROM_DEVICE << 7)) {
          testParam.maxInSize = endpoint.maxPacketSize;
          testParam.inEndpoint = endpoint
        }
      }
    }
    if (bfind) {
      testParam.interface = testParam.config.interfaces[j]
      return bfind
    }
    return false
  }

  function getFlag(testParam, j) {
    if (testParam.config.interfaces[j].endpoints.length == 0) {
      return false
    }

    if (testParam.config.interfaces[j].clazz != 10 ||
      testParam.config.interfaces[j].subclass != 0 ||
      testParam.config.interfaces[j].protocol != 2) {
      return false
    }
    return true
  }

  function initPoint(testParam) {
    for (var j = 0; j < testParam.config.interfaces.length; j++) {
      if (getFlag(testParam, j) == true) {
        if (findInitPoint(testParam, j) == true) {
          break
        }
      }
    }
  }

  // 预制传输相关参数
  function getTransferTestParam() {
    var testParam = {
      config: null,
      device: null,
      pip: null,
      inEndpoint: null,
      interface: null,
      outEndpoint: null,
      usbRequest: null,
      sendData: '',
      isClaimed: 0,
      maxInSize: 1024,
      maxOutSize: 1024
    }

    console.info('usb case  gDeviceList.length: ' + gDeviceList.length);
    for (var i = 0; i < gDeviceList.length; i++) {
      testParam.device = gDeviceList[i]
      testParam.config = testParam.device.configs[0]
      testParam.pip = gPipe
      initPoint(testParam)
    }
    return testParam
  }

  /**
   * @tc.number    : SUB_USB_JS_0630
   * @tc.name      : bulkTransfer
   * @tc.desc      : 批量传输 收数据
   */
  it('SUB_USB_JS_0630', 0, function () {
    console.info('usb SUB_USB_JS_0630 begin');
    console.info('usb SUB_USB_JS_0630 portcurrentMode ret : ' + portCurrentMode)
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.inEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    console.info('usb case readData begin');
    var tmpUint8Array = new Uint8Array(testParam.maxInSize);
    usb.bulkTransfer(testParam.pip, testParam.inEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case readData tmpUint8Array buffer : ' + CheckEmptyUtils.ab2str(tmpUint8Array));
      console.info('usb case readData ret: ' + data);
      console.info('usb case SUB_USB_JS_0630 :  PASS');
      expect(data >= 0).assertTrue();
    }).catch(error => {
      console.info('usb case readData error : ' + JSON.stringify(error));
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number    : SUB_USB_JS_0640
   * @tc.name      : bulkTransfer
   * @tc.desc      : 批量传输 发数据
   */
  it('SUB_USB_JS_0640', 0, function () {
    console.info('usb SUB_USB_JS_0640 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    testParam.isClaimed = usb.claimInterface(testParam.pip, testParam.interface, true);
    expect(testParam.isClaimed).assertEqual(0);

    testParam.sendData = 'send default';
    try {
      testParam.sendData = parameter.getSync('test_usb', 'default');
      console.log('usb parameter ' + JSON.stringify(testParam.sendData));
    } catch (e) {
      console.log('usb parameter getSync unexpected error: ' + e);
    }

    var tmpUint8Array = CheckEmptyUtils.str2ab(testParam.sendData);
    usb.bulkTransfer(testParam.pip, testParam.outEndpoint, tmpUint8Array, 5000).then(data => {
      console.info('usb case SUB_USB_JS_0640 ret: ' + data);
      console.info('usb case SUB_USB_JS_0640 send data: ' + testParam.sendData);
      console.info('usb case SUB_USB_JS_0640 :  PASS');
      expect(true).assertTrue();
    }).catch(error => {
      console.info('usb write error : ' + JSON.stringify(error));
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  })

  /**
   * @tc.number    : SUB_USB_JS_0420
   * @tc.name      : claimInterface
   * @tc.desc      : 获取接口 并释放
   */
  it('SUB_USB_JS_0420', 0, function () {
    console.info('usb SUB_USB_JS_0420 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb 0420 case get_device_list is null')
      expect(gDeviceList.length).assertEqual(-1);
      return
    }

    if (gDeviceList[0].configs.length == 0) {
      console.info('usb 0420 case current device.configs.length = 0');
      expect(false).assertTrue();
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      if (gDeviceList[0].configs[j].interfaces.length == 0) {
        console.info('usb case current device.configs.interfaces.length = 0');
      }
      for (var k = 0; k < gDeviceList[0].configs[j].interfaces.length; k++) {
        var isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[k], true)
        console.info('usb case claimInterface function return: ' + isClaim);
        expect(isClaim).assertEqual(0);
        if (isClaim == 0) {
          isClaim = usb.releaseInterface(gPipe, gDeviceList[0].configs[j].interfaces[k])
          console.info('usb case releaseInterface function return: ' + isClaim);
          expect(isClaim).assertEqual(0);
          gPipe = usb.connectDevice(gDeviceList[0])
        }
      }
    }

    console.info('usb SUB_USB_JS_0420 :  PASS');
    expect(true).assertTrue();
  })

  function getTransferParam(iCmd, iReqTarType, iReqType, iValue, iIndex) {
    var tmpUint8Array = new Uint8Array(512);
    var requestCmd = iCmd
    var requestTargetType = iReqTarType
    var requestType = iReqType
    var value = iValue;
    var index = iIndex;
    var controlParam = {
      request: requestCmd,
      target: requestTargetType,
      reqType: requestType,
      value: value,
      index: index,
      data: tmpUint8Array
    }
    return controlParam
  }

  /**
   * @tc.number    : SUB_USB_JS_0740
   * @tc.name      : setConfiguration
   * @tc.desc      : 设置设备接口
   */
  it('SUB_USB_JS_0740', 0, function () {
    console.info('usb SUB_USB_JS_0740 begin');
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
    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var ret = usb.setConfiguration(gPipe, gDeviceList[0].configs[j])
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertEqual(0);
    }

    console.info('usb SUB_USB_JS_0740 :  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0750
   * @tc.name      : setConfiguration
   * @tc.desc      : 反向测试 设置设备接口
   */
  it('SUB_USB_JS_0750', 0, function () {
    console.info('usb SUB_USB_JS_0750 begin');
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var config = JSON.parse(JSON.stringify(gDeviceList[0].configs[j]));
      config.id = 255
      var ret = usb.setConfiguration(gPipe, config)
      console.info('usb case setConfiguration return : ' + ret);
      expect(ret).assertLess(0);
    }

    console.info('usb SUB_USB_JS_0750 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0800
   * @tc.name      : setInterface
   * @tc.desc      : 设置设备接口
   */
  it('SUB_USB_JS_0800', 0, function () {
    console.info('usb SUB_USB_JS_0800 begin');
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

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)
      expect(isClaim).assertEqual(0)
      if (isClaim == 0) {
        var ret = usb.setInterface(gPipe, gDeviceList[0].configs[j].interfaces[0])
        expect(ret).assertEqual(0);
        console.info('usb case setInterface return : ' + ret);
      }
    }

    console.info('usb SUB_USB_JS_0800 :  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0810
   * @tc.name      : setInterface
   * @tc.desc      : 反向测试 设置设备接口
   */
  it('SUB_USB_JS_0810', 0, function () {
    console.info('usb SUB_USB_JS_0810 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    if (gDeviceList.length == 0) {
      console.info('usb case get_device_list is null')
      expect(false).assertTrue()
      return
    }

    for (var j = 0; j < gDeviceList[0].configs.length; j++) {
      var isClaim = usb.claimInterface(gPipe, gDeviceList[0].configs[j].interfaces[0], true)
      expect(isClaim).assertEqual(0)
      if (isClaim == 0) {
        var tmpInterface = JSON.parse(JSON.stringify(gDeviceList[0].configs[j].interfaces[0]));
        tmpInterface.id = 234
        var ret = usb.setInterface(gPipe, tmpInterface)
        expect(ret).assertLess(0)
        console.info('usb case setInterface return : ' + ret)
      }
    }

    console.info('usb SUB_USB_JS_0810 :  PASS');
    expect(true).assertTrue();
  })

  function callControlTransfer(pip, controlParam, timeout, caseName) {
    usb.controlTransfer(pip, controlParam, timeout).then(data => {
      console.info('usb controlTransfer ret data : ' + data + ' ' + caseName);
      console.info('usb controlTransfer controlParam.data buffer : ' + controlParam.data + ' ' + caseName);
      console.info('usb' + caseName + ':  PASS');
      expect(true).assertTrue();
    }).catch(error => {
      console.info('usb controlTransfer error : ' + JSON.stringify(error));
      console.info('usb' + caseName + ':  FAILED');
      expect(false).assertTrue();
    });
    CheckEmptyUtils.sleep(3000);
  }

  /**
   * @tc.number    : SUB_USB_JS_0540
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 GetDescriptor: cmd 6 target 2 reqType 128 value 512 index 0
   */
  it('SUB_USB_JS_0540', 0, function () {
    console.info('usb SUB_USB_JS_0540 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(6, usb.USB_REQUEST_TARGET_DEVICE, (usb.USB_REQUEST_DIR_FROM_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_STANDARD << 5) | (usb.USB_REQUEST_TARGET_DEVICE & 0x1f), (2 << 8), 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0540 GetDescriptor')
  })

  /**
   * @tc.number    : SUB_USB_JS_0550
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 GetStatus: cmd 0 target 0 reqType 128 value 0 index 0
   */
  it('SUB_USB_JS_0550', 0, function () {
    console.info('usb SUB_USB_JS_0550 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(0, usb.USB_REQUEST_TARGET_DEVICE, (usb.USB_REQUEST_DIR_FROM_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_STANDARD << 5) | (usb.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0550 GetStatus')
  })

  /**
   * @tc.number    : SUB_USB_JS_0560
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 GetConfiguration: cmd 8 target 0 reqType 128 value 0 index 0
   */
  it('SUB_USB_JS_0560', 0, function () {
    console.info('usb SUB_USB_JS_0560 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(8, usb.USB_REQUEST_TARGET_DEVICE, (usb.USB_REQUEST_DIR_FROM_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_STANDARD << 5) | (usb.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0560 GetConfiguration')
  })

  /**
   * @tc.number    : SUB_USB_JS_0570
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 GetInterface: cmd 10 target 0 reqType 129 value 0 index 1
   */
  it('SUB_USB_JS_0570', 0, function () {
    console.info('usb SUB_USB_JS_0570 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(10, usb.USB_REQUEST_TARGET_INTERFACE, (usb.USB_REQUEST_DIR_FROM_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_STANDARD << 5) | (usb.USB_REQUEST_TARGET_INTERFACE & 0x1f), 0, 1)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0570 GetInterface')
  })

  /**
   * @tc.number    : SUB_USB_JS_0580
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 ClearFeature: cmd 1 target 0 reqType 0 value 0 index 0
   */
  it('SUB_USB_JS_0580', 0, function () {
    console.info('usb SUB_USB_JS_0580 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(1, usb.USB_REQUEST_TARGET_DEVICE, (usb.USB_REQUEST_DIR_TO_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_STANDARD << 5) | (usb.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0580 ClearFeature')
  })

  /**
   * @tc.number    : SUB_USB_JS_0590
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 ClearFeature: cmd 255 target 1 reqType 129 value 512 index 0
   */
   it('SUB_USB_JS_0590', 0, function () {
    console.info('usb SUB_USB_JS_0590 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usb.USB_REQUEST_TARGET_INTERFACE, (usb.USB_REQUEST_DIR_FROM_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_STANDARD << 5) | (usb.USB_REQUEST_TARGET_INTERFACE & 0x1f), (2 << 8), 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0590 ClearFeature')
  })

  /**
   * @tc.number    : SUB_USB_JS_0600
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 ClearFeature: cmd 255 target 2 reqType 34 value 512 index 0
   */
   it('SUB_USB_JS_0600', 0, function () {
    console.info('usb SUB_USB_JS_0600 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usb.USB_REQUEST_TARGET_ENDPOINT, (usb.USB_REQUEST_DIR_TO_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_CLASS << 5) | (usb.USB_REQUEST_TARGET_ENDPOINT & 0x1f), (2 << 8), 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0600 ClearFeature')
  })

  /**
   * @tc.number    : SUB_USB_JS_0610
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 ClearFeature: cmd 255 target 3 reqType 67 value 512 index 0
   */
   it('SUB_USB_JS_0610', 0, function () {
    console.info('usb SUB_USB_JS_0610 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usb.USB_REQUEST_TARGET_OTHER, (usb.USB_REQUEST_DIR_TO_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_VENDOR << 5) | (usb.USB_REQUEST_TARGET_OTHER & 0x1f), (2 << 8), 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0610 ClearFeature')
  })

  /**
   * @tc.number    : SUB_USB_JS_0620
   * @tc.name      : controlTransfer
   * @tc.desc      : 控制传输 ClearFeature: cmd 255 target 3 reqType 35 value 0 index 0
   */
   it('SUB_USB_JS_0620', 0, function () {
    console.info('usb SUB_USB_JS_0620 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }

    var timeout = 5000;
    var controlParam = getTransferParam(255, usb.USB_REQUEST_TARGET_OTHER, (usb.USB_REQUEST_DIR_TO_DEVICE << 7)
        | (usb.USB_REQUEST_TYPE_CLASS << 5) | (usb.USB_REQUEST_TARGET_OTHER & 0x1f), 0, 0)
    callControlTransfer(testParam.pip, controlParam, timeout, 'SUB_USB_JS_0620 ClearFeature')
  })

  /**
   * @tc.number    : SUB_USB_JS_1140
   * @tc.name      : controlTransfer
   * @tc.desc      : 反向测试 控制传输 参数类型错误
   */
   it('SUB_USB_JS_1140', 0, function () {
    console.info('usb SUB_USB_JS_1140 begin');
    if (portCurrentMode == 1) {
      console.info('usb case get_device port is device')
      expect(false).assertFalse();
      return
    }
    var testParam = getTransferTestParam()
    if (testParam.inEndpoint == null || testParam.interface == null || testParam.outEndpoint == null) {
      expect(false).assertTrue();
      return
    }
    try {
      var maskCode = usb.controlTransfer("invalid");
      console.info('usb case controlTransfer return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1140 :  PASS');
    }
  })
})
}
