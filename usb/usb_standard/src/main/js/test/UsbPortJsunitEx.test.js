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
export default function UsbPortJsFunctionsTestEx() {
describe('UsbPortJsFunctionsTestEx', function () {

  var gPort;
  beforeAll(function () {
    console.log('*************Usb Unit UsbPortJsFunctionsTestEx Begin*************');
    var Version = usb.getVersion()
    console.info('begin test getversion :' + Version)
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Case*************');
  })

  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Case*************');
  })

  afterAll(function () {
    console.log('*************Usb Unit UsbPortJsFunctionsTest End*************');
  })

  /**
   * @tc.number    : SUB_USB_JS_0230
   * @tc.name      : getSupportedModes
   * @tc.desc      : 反向测试 改变id 获取指定的端口支持的模式列表的组合掩码
   */
  it('SUB_USB_JS_0230', 0, function () {
    console.info('usb SUB_USB_JS_0230 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0230 usbPortList is null');
      expect(false).assertTrue();
      return
    }

    expect(usbPortList.length > 0).assertTrue();
    gPort = usbPortList[0]
    var portID = usbPortList[0].id + 10
    var maskCode = usb.getSupportedModes(portID)
    expect(maskCode).assertEqual(usb.NONE);

    console.info('usb SUB_USB_JS_0230 :  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_1210
   * @tc.name      : getSupportedModes
   * @tc.desc      : 反向测试 获取指定的端口支持的模式列表的组合掩码 参数类型错误
   */
   it('SUB_USB_JS_1210', 0, function () {
    console.info('usb SUB_USB_JS_1210 begin');
    try {
      var maskCode = usb.getSupportedModes("invalid");
      console.info('usb 1210 case getSupportedModes return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1210 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1210 :  PASS');
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_1380
   * @tc.name      : getSupportedModes
   * @tc.desc      : 反向测试 获取指定的端口支持的模式列表的组合掩码 参数个数错误，必要参数未传入
   */
   it('SUB_USB_JS_1380', 0, function () {
    console.info('usb SUB_USB_JS_1380 begin');
    try {
      var maskCode = usb.getSupportedModes();
      console.info('usb 1380 case getSupportedModes return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1380 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1380 :  PASS');
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_0030
   * @tc.name      : setPortRoles
   * @tc.desc      : dataRole参数错误
   */
  it('SUB_USB_JS_0030', 0, function () {
    var portId = gPort.id;
    var powerRole = usb.SINK;
    var dataRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb case setPortRoles return: ' + data);
      expect(data).assertTrue();
    }).catch(error => {
      console.info('usb case setPortRoles error : ' + error);
      expect(error).assertFalse();
      console.info('usb SUB_USB_JS_0030:  PASS');
    })
    CheckEmptyUtils.sleep(8000)

    console.info('usb SUB_USB_JS_0030:  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0040
   * @tc.name      : setPortRoles
   * @tc.desc      : portId，powerRole参数错误
   */
  it('SUB_USB_JS_0040', 0, function () {
    var portId = gPort.id;
    var powerRole = usb.NONE - 1;
    var dataRole = usb.DEVICE;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb case setPortRoles return: ' + data);
      expect(data).assertTrue();
    }).catch(error => {
      console.info('usb case setPortRoles error : ' + error);
      expect(error).assertFalse();
      console.info('usb SUB_USB_JS_0040:  PASS');
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0040:  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0050
   * @tc.name      : setPortRoles
   * @tc.desc      : portId，dataRole参数错误
   */
  it('SUB_USB_JS_0050', 0, function () {
    var portId = gPort.id - 3;
    var powerRole = usb.SINK;
    var dataRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb case setPortRoles return: ' + data);
      expect(data).assertTrue();
    }).catch(error => {
      console.info('usb case setPortRoles error : ' + error);
      expect(error).assertFalse();
      console.info('usb SUB_USB_JS_0050:  PASS');
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0050:  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0060
   * @tc.name      : setPortRoles
   * @tc.desc      : powerRole，dataRole参数错误
   */
  it('SUB_USB_JS_0060', 0, function () {
    var portId = gPort.id;
    var powerRole = usb.NONE - 1;
    var dataRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb case setPortRoles return: ' + data);
      expect(data).assertTrue();
    }).catch(error => {
      console.info('usb case setPortRoles error : ' + error);
      expect(error).assertFalse();
      console.info('usb SUB_USB_JS_0060:  PASS');
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0060:  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0070
   * @tc.name      : setPortRoles
   * @tc.desc      : portId,powerRole，dataRole参数错误
   */
  it('SUB_USB_JS_0070', 0, function () {
    var portId = gPort.id - 1;
    var dataRole = usb.NONE - 1;
    var powerRole = usb.NONE - 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb case setPortRoles return: ' + data);
      expect(data).assertTrue();
    }).catch(error => {
      console.info('usb case setPortRoles error : ' + error);
      expect(error).assertFalse();
      console.info('usb SUB_USB_JS_0070:  PASS');
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0070:  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0080
   * @tc.name      : setPortRoles
   * @tc.desc      : portId参数错误
   */
  it('SUB_USB_JS_0080', 0, function () {
    var portId = gPort.id - 1;
    var powerRole = 1;
    var dataRole = 1;
    usb.setPortRoles(portId, powerRole, dataRole).then(data => {
      console.info('usb case setPortRoles return: ' + data);
      expect(data).assertTrue();
    }).catch(error => {
      console.info('usb case setPortRoles error : ' + error);
      expect(error).assertFalse();
      console.info('usb SUB_USB_JS_0080:  PASS');
    })
    CheckEmptyUtils.sleep(8000)
    console.info('usb SUB_USB_JS_0080:  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_1190
   * @tc.name      : setPortRoles
   * @tc.desc      : 反向测试 port功能切换 参数个数错误
   */
   it('SUB_USB_JS_1190', 0, function () {
    console.info('usb SUB_USB_JS_1190 begin');
    try {
      var maskCode = usb.setPortRoles("invalid");
      console.info('usb 1190 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1190 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1190 :  PASS');
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_1390
   * @tc.name      : setPortRoles
   * @tc.desc      : 反向测试 port功能切换 参数个数错误，必要参数未传入
   */
   it('SUB_USB_JS_1390', 0, function () {
    console.info('usb SUB_USB_JS_1390 begin');
    try {
      var maskCode = usb.setPortRoles();
      console.info('usb 1390 case setPortRoles return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1390 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1390 :  PASS');
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_1200
   * @tc.name      : getPorts
   * @tc.desc      : 反向测试 获取USB端口描述信息列表 入参错误(无参接口传参)
   */
   it('SUB_USB_JS_1200', 0, function () {
    console.info('usb SUB_USB_JS_1200 begin');
    try {
      var maskCode = usb.getPorts("invalid");
      console.info('usb 1200 case getPorts return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1200 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1200 :  PASS');
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_1180
   * @tc.name      : setCurrentFunctions
   * @tc.desc      : 反向测试 在设备模式下设置当前的USB功能列表 参数类型错误
   */
   it('SUB_USB_JS_1180', 0, function () {
    console.info('usb SUB_USB_JS_1180 begin');
    try {
      var maskCode = usb.setCurrentFunctions("invalid");
      console.info('usb 1180 case setCurrentFunctions return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1180 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1180 :  PASS');
    }
  })

  /**
   * @tc.number    : SUB_USB_JS_1400
   * @tc.name      : setCurrentFunctions
   * @tc.desc      : 反向测试 在设备模式下设置当前的USB功能列表 参数个数错误，必要参数未传入
   */
   it('SUB_USB_JS_1400', 0, function () {
    console.info('usb SUB_USB_JS_1400 begin');
    try {
      var maskCode = usb.setCurrentFunctions();
      console.info('usb 1400 case setCurrentFunctions return: ' + maskCode);
      expect(false).assertTrue();
    } catch (err) {
      console.info('usb 1400 catch err code: ' + err.code + ' message: ' + err.message);
      expect(err.code).assertEqual(401);
      console.info('usb SUB_USB_JS_1400 :  PASS');
    }
  })
})
}
