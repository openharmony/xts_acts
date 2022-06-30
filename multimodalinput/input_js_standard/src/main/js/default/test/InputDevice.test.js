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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect
} from 'deccjsunit/index'

describe('MultimodalInput_test', function () {

  // 参数正确,返回一个数组
  it('inputDevice::getDeviceIds_test-01', 0, function () {
    console.log(`inputDevice::getDeviceIds_test-01 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        expect(data).assertInstanceOf('Array');
      }
      console.log(`inputDevice::getDeviceIds_test-01 exit`);
    })
  })

  // 参数正确,判断一种或多种设备
  it("inputDevice::getDeviceIds_test-02", 0, function () {
    console.log(`inputDevice::getDeviceIds_test-02 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        expect(data.length > 0).assertTure();
      }
      console.log(`inputDevice::getDeviceIds_test-02 exit`);
    })
  })

  // 参数类型错误
  it("inputDevice::getDeviceIds_test-03", 0, function () {
    console.log(`inputDevice::getDeviceIds_test-03 enter`);
    try {
      inputDevice.getDeviceIds(-1);
    } catch (error) {
      expect(error.message).assertEqual("GetDeviceIds: \"The first parameter type is wrong\"");
    }
    console.log(`inputDevice::getDeviceIds_test-03 exit`);
  })

  // 参数数量错误
  it("inputDevice::getDeviceIds_test-04", 0, function () {
    console.log(`inputDevice::getDeviceIds_test-04 enter`);
    try {
      inputDevice.getDeviceIds(-1, (data) => {
        console.log(data);
      });
    } catch (error) {
      expect(error.message).assertEqual("GetDeviceIds: \"too many parameters\"");
    }
    console.log(`inputDevice::getDeviceIds_test-04 exit`);
  })

  // 无效的设备id
  it("inputDevice::getDevice_test-01", 0, function () {
    console.log(`inputDevice::getDevice_test-01 enter`);
    inputDevice.getDevice(-1, (data, err) => {
      if (err) {
        expect(false).assertTrue();
        console.log(`inputDevice::getDevice_test-01 ${JSON.stringify(err)}`);
      } else {
        expect(JSON.stringify(data) !== "{}").assertTrue();
      }
      console.log(`inputDevice::getDevice_test-01 exit`);
    })
  })

  // 参数正常,返回值正常
  it("inputDevice::getDevice_test-02", 0, function () {
    console.log(`inputDevice::getDevice_test-03 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        let arr = [];
        for (let i = 0; i < data.length; i++) {
          inputDevice.getDevice(data[i], (res, err) => {
            console.log(`getDevice:data ${JSON.stringify(data)}`)
            arr = Object.keys(res);
            expect(res.id).assertInstanceOf('number');
            expect(res.name).assertInstanceOf('string');
            expect(res.sources).assertInstanceOf('Array');
            expect(res.axisRanges).assertInstanceOf('Array');
          })
          expect(arr.length > 0).assertTrue();
        }
      }
      console.log(`inputDevice::getDevice_test-02 exit`);
    });
  })

  // 参数正常,返回值正常
  it("inputDevice::supportKeys_test-01", 0, function () {
    console.log(`inputDevice::supportKeys_test-01 enter`);
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
      console.log(`inputDevice::supportKeys_test-01 exit`);
    });
  })

  // 第二个参数异常
  it("inputDevice::supportKeys_test-02", 0, function () {
    console.log(`inputDevice::supportKeys_test-01 enter`);
    try {
      inputDevice.supportKeys(0, 2022, (res) => {
        console.log(res);
      });
    } catch (error) {
      expect(error.message).assertEqual("SupportKeys: \"The second parameter type is wrong\"");
    }
    console.log(`inputDevice::supportKeys_test-02 exit`);
  })

  // 参数正常
  it("inputDevice::getKeyboardType_test-01", 0, function () {
    console.log(`inputDevice::getKeyboardType_test-01 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        for (let i = 0; i < data.length; ++i) {
          inputDevice.getKeyboardType(data[i], (res, err) => {
            expect(res).assertInstanceOf('number');
          });
        }
      }
      console.log(`inputDevice::getKeyboardType_test-01 exit`);
    });
  })

  //参数异常
  it("inputDevice::getKeyboardType_test-02", 0, function () {
    console.log(`inputDevice::getKeyboardType_test-02 enter`);
    try {
      inputDevice.getKeyboardType(-1);
    } catch (error) {
      expect(error.message).assertEqual("getKeyboardType: \"The second parameter type is wrong\"");
    }
    console.log(`inputDevice::getKeyboardType_test-02 exit`);
  });

  // 参数正常
  it("inputDevice::getKeyboardType_test-03", 0, function () {
    console.log(`inputDevice::getKeyboardType_test-03 enter`);
    inputDevice.getDeviceIds((data, err) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        for (let i = 0; i < data.length; ++i) {
          inputDevice.getKeyboardType(data[i]).then((res) => {
            expect(res).assertInstanceOf('number');
            done();
          });
        }
      }
      console.log(`inputDevice::getKeyboardType_test-03 exit`);
    });
  })

  /**
   * @tc.number MultimodalInputDevice_js_0010
   * @tc.name remainingChargeTime_test
   * @tc.desc Battry Present Interface Test
   */
  it('MultimodalInputDevice_KeyboardType_NONE_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_NONE_test = ' + inputDevice.KeyboardType.NONE);
    expect(inputDevice.KeyboardType.NONE == 0).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0020
   * @tc.name remainingChargeTime_test
   * @tc.desc Battry Present Interface Test
   */
  it('MultimodalInputDevice_KeyboardType_UNKNOWN_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_UNKNOWN_test = ' + inputDevice.KeyboardType.UNKNOWN);
    expect(inputDevice.KeyboardType.UNKNOWN == 1).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0030
   * @tc.name remainingChargeTime_test
   * @tc.desc Battry Present Interface Test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_KEYBOARD_test = '
      + inputDevice.KeyboardType.ALPHABETIC_KEYBOARD);
    expect(inputDevice.KeyboardType.ALPHABETIC_KEYBOARD == 2).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0040
   * @tc.name remainingChargeTime_test
   * @tc.desc Battry Present Interface Test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_DIGITAL_KEYBOARD_test = '
      + inputDevice.KeyboardType.DIGITAL_KEYBOARD);
    expect(inputDevice.KeyboardType.DIGITAL_KEYBOARD == 3).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0040
   * @tc.name remainingChargeTime_test
   * @tc.desc Battry Present Interface Test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_HANDWRITING_PEN_test = '
      + inputDevice.KeyboardType.HANDWRITING_PEN);
    expect(inputDevice.KeyboardType.HANDWRITING_PEN == 4).assertTrue();
  })

  /**
   * @tc.number MultimodalInputDevice_js_0040
   * @tc.name remainingChargeTime_test
   * @tc.desc Battry Present Interface Test
   */
  it('MultimodalInputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test', 0, function () {
    console.info('MultimodalInputDevice_KeyboardType_ALPHABETIC_REMOTE_CONTROL_test = '
      + inputDevice.KeyboardType.REMOTE_CONTROL);
    expect(inputDevice.KeyboardType.REMOTE_CONTROL == 5).assertTrue();
  })

  it('ultimodalInputDevice_Startlistening_InputDevice_Events_test',0,function(){
    inputDevice.on("change",()=>{
        var Type = inputDevice.DeviceListener.type
        var IdNumber = inputDevice.DeviceListener.deviceId
        console.info(Type)
        expect(inputDevice.DeviceListener.type === 'add'|| inputDevice.DeviceListener.type === 'remove').assertTrue();
        console.info(IdNumber)
        expect(inputDevice.DeviceListener.type).assertInstanceOf('number');
    }) 
  })

  it('ultimodalInputDevice_Stoplistening_InputDevice_Events_test',0,function(){
    inputDevice.off("change",()=>{
        var Type = inputDevice.DeviceListener.type
        var IdNumber = inputDevice.DeviceListener.deviceId
        console.info(Type)
        expect(inputDevice.DeviceListener.type === 'add'|| inputDevice.DeviceListener.type === 'remove').assertTrue();
        console.info(IdNumber)
        expect(inputDevice.DeviceListener.type).assertInstanceOf('number');
    }) 
  })
  // 参数正确,返回一个数组
  it('inputDevice::getDeviceIds_test-01', 0, function () {
      console.log(`inputDevice::getDeviceIds_test-01 enter`);
      inputDevice.getDeviceIds()
      .then((data)=>{
          expect(data).assertInstanceOf('Array');
      })
      .catch(error => {
          expect(false).assertTrue();
      })
    })
  
  // 参数正确,判断一种或多种设备
  it("inputDevice::getDeviceIds_test-02", 0, function () {
    console.log(`inputDevice::getDeviceIds_test-02 enter`);
    inputDevice.getDeviceIds()
    .then((data)=>{
        expect(data.length > 0).assertTure();
    })
    .catch(error => {
        expect(false).assertTrue();
    })
  })


  it("inputDevice::setPointerLocation_test-01", 0, function () {
    console.log(`inputDevice::setPointerLocation_test-01 enter`);
    inputDevice.setPointerLocation(1,2)
    .then((data)=>{
        expect(data).assertTure();
    })
    .catch(error => {
        expect(false).assertTrue();
    })
    console.log(`inputDevice::setPointerLocation_test-01 exit`);
  })

  
    

  it("inputDevice::setPointerLocation_test-02", 0, function () {
    console.log(`inputDevice::setPointerLocation_test-02 enter`);
        inputDevice.setPointerLocation(1,2,(data,error)=>{
            if(data){
                expect(true).assertTure();
            }else{
                expect(false).assertTrue();
            }
        })
  })


  it('inputDevice::DeviceListener_test-01', 0, function () {
    console.log(`inputDevice::DeviceListener_test-01 enter`);

    expect(  (inputDevice.DeviceListener.type=='add' || 'remove')).assertTrue();

    console.log(`inputDevice::DeviceListener_test-01 exit`);
  })

  it('inputDevice::DeviceListener_test-02', 0, function () {
      console.log(`inputDevice::DeviceListener_test-02 enter`);

      expect(  (inputDevice.DeviceListener.deviceId)).assertInstanceOf("number");

      console.log(`inputDevice::DeviceListener_test-02 exit`);
  })

  it('inputDevice::AxisRange_test-01', 0, function () {
      console.log(`inputDevice::AxisRange_test-01 enter`);

      expect((inputDevice.AxisRange.source=='keyboard'||'mouse'||'touchpad'||'touchscreen'
        ||'joystick'||'trackball')).assertTrue();

      console.log(`inputDevice::AxisRange_test-01 exit`);
  })


  it('inputDevice::AxisRange_test-02', 0, function () {
      console.log(`inputDevice::AxisRange_test-02 enter`);

      expect((inputDevice.AxisRange.axis=='touchMajor' || 'touchMinor' || 'orientation' || 'x' || 'y' || 'pressure'
        || 'toolMinor' || 'toolMajor' || 'NULL')).assertTrue();

      console.log(`inputDevice::AxisRange_test-02 exit`);
  })

  it('inputDevice::AxisRange_test-03', 0, function () {
      console.log(`inputDevice::AxisRange_test-03 enter`);

      expect(  (inputDevice.AxisRange.max)).assertInstanceOf("number");

      console.log(`inputDevice::AxisRange_test-03 exit`);
  })

  it('inputDevice::AxisRange_test-04', 0, function () {
      console.log(`inputDevice::AxisRange_test-04 enter`);

      expect(  (inputDevice.AxisRange.min)).assertInstanceOf("number");

      console.log(`inputDevice::AxisRange_test-04 exit`);
  })

  it('inputDevice::AxisRange_test-05', 0, function () {
      console.log(`inputDevice::AxisRange_test-05 enter`);

      expect(  (inputDevice.AxisRange.fuzz)).assertInstanceOf("number");

      console.log(`inputDevice::AxisRange_test-05 exit`);
  })


  it('inputDevice::AxisRange_test-06', 0, function () {
      console.log(`inputDevice::AxisRange_test-06 enter`);

      expect(  (inputDevice.AxisRange.flat)).assertInstanceOf("number");

      console.log(`inputDevice::AxisRange_test-06 exit`);
  })

  it('inputDevice::AxisRange_test-07', 0, function () {
      console.log(`inputDevice::AxisRange_test-07 enter`);

      expect(  (inputDevice.AxisRange.resolution)).assertInstanceOf("number");

      console.log(`inputDevice::AxisRange_test-07 exit`);
  })

  it('inputDevice::InputDeviceData_test-01', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-01 enter`);

      expect(  (inputDevice.InputDeviceData.id)).assertInstanceOf("number");

      console.log(`inputDevice::InputDeviceData_test-01 exit`);
  })

  it('inputDevice::InputDeviceData_test-02', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-02 enter`);

      expect(  (inputDevice.InputDeviceData.name)).assertInstanceOf("string");

      console.log(`inputDevice::InputDeviceData_test-02 exit`);
  })


  it('inputDevice::InputDeviceData_test-03', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-03 enter`);

      expect(  (inputDevice.InputDeviceData.sources)).assertInstanceOf("Array");

      console.log(`inputDevice::InputDeviceData_test-03 exit`);
  })


  it('inputDevice::InputDeviceData_test-04', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-04 enter`);

      expect(  (inputDevice.InputDeviceData.axisRanges)).assertInstanceOf("Array");

      console.log(`inputDevice::InputDeviceData_test-04 exit`);
  })


  it('inputDevice::InputDeviceData_test-05', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-05 enter`);

      expect(  (inputDevice.InputDeviceData.bus)).assertInstanceOf("Array");

      console.log(`inputDevice::InputDeviceData_test-05 exit`);
  })



  it('inputDevice::InputDeviceData_test-06', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-06 enter`);

      expect(  (inputDevice.InputDeviceData.product)).assertInstanceOf("number");

      console.log(`inputDevice::InputDeviceData_test-06 exit`);
  })


  it('inputDevice::InputDeviceData_test-07', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-07 enter`);

      expect(  (inputDevice.InputDeviceData.vendor)).assertInstanceOf("number");

      console.log(`inputDevice::InputDeviceData_test-07 exit`);
  })

  it('inputDevice::InputDeviceData_test-08', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-08 enter`);

      expect(  (inputDevice.InputDeviceData.version)).assertInstanceOf("number");

      console.log(`inputDevice::InputDeviceData_test-08 exit`);
  })


  it('inputDevice::InputDeviceData_test-09', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-09 enter`);

      expect(  (inputDevice.InputDeviceData.phys)).assertInstanceOf("string");

      console.log(`inputDevice::InputDeviceData_test-09 exit`);
  })

  it('inputDevice::InputDeviceData_test-10', 0, function () {
      console.log(`inputDevice::InputDeviceData_test-10 enter`);

      expect(  (inputDevice.InputDeviceData.uniq)).assertInstanceOf("string");

      console.log(`inputDevice::InputDeviceData_test-10 exit`);
  })

})
