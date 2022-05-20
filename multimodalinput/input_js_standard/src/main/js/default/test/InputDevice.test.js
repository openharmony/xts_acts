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
      expect(error.message).assertEqual("GetDeviceIds: \"The first parameter type is wrong\"");
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
})
