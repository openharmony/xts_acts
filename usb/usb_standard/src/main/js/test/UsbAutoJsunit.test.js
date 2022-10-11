/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import usb from '@ohos.usb';
import CheckEmptyUtils from './CheckEmptyUtils.js';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

/* usb core functions test */
export default function UsbAutoJsunit() {
describe('UsbAutoJsunit', function () {

  beforeAll(function () {
    console.log('*************Usb Unit UsbAutoJsunit Begin*************');
    var Version = usb.getVersion()
    console.info('begin test getversion :' + Version)

    // 切换到 device
    var usbPortList = usb.getPorts()
    if (usbPortList.length > 0) {
      if (usbPortList[0].status.currentMode == 2) {
        console.info('usb case set data role 1, data role 1');
        usb.setPortRoles(usbPortList[0].id, 2, 2).then(data => {
          console.info('usb case setPortRoles return: ' + data);
        }).catch(error => {
          console.info('usb case setPortRoles error : ' + error);
        });
        CheckEmptyUtils.sleep(8000)
        console.log('*************Usb Unit switch to device Begin*************');
      }
    }
  })
  beforeEach(function () {
    console.info('beforeEach: *************Usb Unit Test Case*************');
  })

  afterEach(function () {
    console.info('afterEach: *************Usb Unit Test Case*************');
  })

  afterAll(function () {
    console.log('*************Usb Unit UsbAutoJsunit End*************');
  })

  /**
   * @tc.number    : SUB_USB_JS_0930
   * @tc.name      : usbFunctionsToString
   * @tc.desc      : 正向测试 0 返回 'none'
   */
  it('SUB_USB_JS_0930', 0, function () {
    console.info('usb SUB_USB_JS_0930 begin');
    var maskCode = 0
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    expect(strMaskCode).assertEqual('none');
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    console.info('usb SUB_USB_JS_0930 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0940
   * @tc.name      : usbFunctionsToString
   * @tc.desc      : 正向测试 1 返回 'acm'
   */
  it('SUB_USB_JS_0940', 0, function () {
    console.info('usb SUB_USB_JS_0940 begin');
    var maskCode = 1
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    expect(strMaskCode).assertEqual('acm');
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    console.info('usb SUB_USB_JS_0940 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0950
   * @tc.name      : usbFunctionsToString
   * @tc.desc      : 正向测试 2 返回 'ecm'
   */
  it('SUB_USB_JS_0950', 0, function () {
    console.info('usb SUB_USB_JS_0950 begin');
    var maskCode = 2
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    expect(strMaskCode).assertEqual('ecm');
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    console.info('usb SUB_USB_JS_0950 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0960
   * @tc.name      : usbFunctionsToString
   * @tc.desc      : 正向测试 3 返回 'acm,ecm'
   */
  it('SUB_USB_JS_0960', 0, function () {
    console.info('usb SUB_USB_JS_0960 begin');
    var maskCode = 3
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    expect(strMaskCode).assertEqual('acm,ecm');
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    console.info('usb SUB_USB_JS_0960 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0970
   * @tc.name      : usbFunctionsToString
   * @tc.desc      : 正向测试 4 返回 'hdc'
   */
  it('SUB_USB_JS_0970', 0, function () {
    console.info('usb SUB_USB_JS_0970 begin');
    var maskCode = 4
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    expect(strMaskCode).assertEqual('hdc');
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    console.info('usb SUB_USB_JS_0970 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0980
   * @tc.name      : usbFunctionsToString
   * @tc.desc      : 正向测试 5 返回 'acm,hdc'
   */
  it('SUB_USB_JS_0980', 0, function () {
    console.info('usb SUB_USB_JS_0980 begin');
    var maskCode = 5
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    expect(strMaskCode).assertEqual('acm,hdc');
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    console.info('usb SUB_USB_JS_0980 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0990
   * @tc.name      : usbFunctionsToString
   * @tc.desc      : 正向测试 6 返回 'ecm,hdc'
   */
  it('SUB_USB_JS_0990', 0, function () {
    console.info('usb SUB_USB_JS_0990 begin');
    var maskCode = 6
    var strMaskCode = usb.usbFunctionsToString(maskCode)
    expect(strMaskCode).assertEqual('ecm,hdc');
    console.info('usb case maskCode ' + maskCode + ' usbFunctionsToString return int: ' + strMaskCode);
    console.info('usb SUB_USB_JS_0990 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0860
   * @tc.name      : usbFunctionsFromString
   * @tc.desc      : 正向测试 'none' 返回 0
   */
  it('SUB_USB_JS_0860', 0, function () {
    console.info('usb SUB_USB_JS_0860 begin');
    var strMaskCode = 'none'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    expect(nMaskCode).assertEqual(0);
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    console.info('usb SUB_USB_JS_0860 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0870
   * @tc.name      : usbFunctionsFromString
   * @tc.desc      : 正向测试 'acm' 返回 1
   */
  it('SUB_USB_JS_0870', 0, function () {
    console.info('usb SUB_USB_JS_0870 begin');
    var strMaskCode = 'acm'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    expect(nMaskCode).assertEqual(1);
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    console.info('usb SUB_USB_JS_0870 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0880
   * @tc.name      : usbFunctionsFromString
   * @tc.desc      : 正向测试 'ecm' 返回 2
   */
  it('SUB_USB_JS_0880', 0, function () {
    console.info('usb SUB_USB_JS_0880 begin');
    var strMaskCode = 'ecm'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    expect(nMaskCode).assertEqual(2);
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    console.info('usb SUB_USB_JS_0880 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0890
   * @tc.name      : usbFunctionsFromString
   * @tc.desc      : 正向测试 'acm,ecm' 返回 3
   */
  it('SUB_USB_JS_0890', 0, function () {
    console.info('usb SUB_USB_JS_0890 begin');
    var strMaskCode = 'acm,ecm'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    expect(nMaskCode).assertEqual(3);
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    console.info('usb SUB_USB_JS_0890 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0900
   * @tc.name      : usbFunctionsFromString
   * @tc.desc      : 正向测试 'hdc' 返回 4
   */
  it('SUB_USB_JS_0900', 0, function () {
    console.info('usb SUB_USB_JS_0900 begin');
    var strMaskCode = 'hdc'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    expect(nMaskCode).assertEqual(4);
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    console.info('usb SUB_USB_JS_0900 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0910
   * @tc.name      : usbFunctionsFromString
   * @tc.desc      : 正向测试 'acm,hdc' 返回 5
   */
  it('SUB_USB_JS_0910', 0, function () {
    console.info('usb SUB_USB_JS_0910 begin');
    var strMaskCode = 'acm,hdc'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    expect(nMaskCode).assertEqual(5);
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    console.info('usb SUB_USB_JS_0910 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0920
   * @tc.name      : usbFunctionsFromString
   * @tc.desc      : 正向测试 'ecm,hdc' 返回 6
   */
  it('SUB_USB_JS_0920', 0, function () {
    console.info('usb SUB_USB_JS_0920 begin');
    var strMaskCode = 'ecm,hdc'
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    expect(nMaskCode).assertEqual(6);
    console.info('usb case strMaskCode ' + strMaskCode + ' usbFunctionsFromString return int: ' + nMaskCode);
    console.info('usb SUB_USB_JS_0920 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0330
   * @tc.name      : getCurrentFunctions
   * @tc.desc      : 获取当前设备模式 掩码与描述字符转换
   */
  it('SUB_USB_JS_0330', 0, function () {
    console.info('usb SUB_USB_JS_0330 begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);

    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case usbFunctionsToString return str: ' + strMaskCode);
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode usbFunctionsFromString return int: ' + nMaskCode);
    expect(nMaskCode).assertEqual(maskCode);
    console.info('usb SUB_USB_JS_0330 :  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0340
   * @tc.name      : usbFunctionString
   * @tc.desc      : 反向测试 获取当前设备模式 掩码与描述字符转换
   */
  it('SUB_USB_JS_0340', 0, function () {
    console.info('usb SUB_USB_JS_0340 begin');
    var maskCode = usb.getCurrentFunctions();
    console.info('usb case getCurrentFunctions return: ' + maskCode);

    var strMaskCode = usb.usbFunctionsToString(maskCode)
    console.info('usb case usbFunctionsToString return str: ' + strMaskCode);
    var nMaskCode = usb.usbFunctionsFromString(strMaskCode)
    console.info('usb case strMaskCode usbFunctionsFromString return int: ' + nMaskCode);

    var errmaskCode = 0
    var strMaskCode = usb.usbFunctionsToString(errmaskCode)

    console.info('usb case ' + errmaskCode + ' usbFunctionsToString return str: ' + strMaskCode);

    var errStrMaskCode = 'none'
    var nMaskCode = usb.usbFunctionsFromString(errStrMaskCode)
    expect(nMaskCode).assertEqual(0);
    console.info('usb case errStrMaskCode ' + errStrMaskCode +
      ' usbFunctionsFromString return int: ' + nMaskCode);

    console.info('usb SUB_USB_JS_0340 :  PASS');
  })

  /**
   * @tc.number    : SUB_USB_JS_0410
   * @tc.name      : getPorts
   * @tc.desc      : 获取USB端口描述信息列表
   */
  it('SUB_USB_JS_0410', 0, function () {
    console.info('usb SUB_USB_JS_0410 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0410 usbPortList is null');
      expect(false).assertTrue();
      return
    }
    expect(usbPortList.length > 0).assertTrue();
    console.info('usb SUB_USB_JS_0410 :  PASS');
    expect(true).assertTrue();
  })

  /**
   * @tc.number    : SUB_USB_JS_0220
   * @tc.name      : getSupportedModes
   * @tc.desc      : 获取指定的端口支持的模式列表的组合掩码
   */
  it('SUB_USB_JS_0220', 0, function () {
    console.info('usb SUB_USB_JS_0220 begin');
    var usbPortList = usb.getPorts()
    if (usbPortList.length == 0) {
      console.info('usb SUB_USB_JS_0220 usbPortList is null');
      expect(false).assertTrue();
      return
    }

    expect(usbPortList.length > 0).assertTrue();
    for (var i = 0; i < usbPortList.length; i++) {
      var maskCode = usb.getSupportedModes(usbPortList[i].id)
      expect(maskCode).assertEqual(usbPortList[i].supportedModes);
    }

    console.info('usb SUB_USB_JS_0220 :  PASS');
    expect(true).assertTrue();
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

    var portID = usbPortList[0].id + 10
    var maskCode = usb.getSupportedModes(portID)
    expect(maskCode).assertEqual(0);

    console.info('usb SUB_USB_JS_0230 :  PASS');
    expect(true).assertTrue();
  })

})
}
