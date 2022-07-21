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
    console.info(`inputDevice::getDeviceIds_test-01 enter`);
    inputDevice.getDeviceIds((err, data) => {
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
    inputDevice.getDeviceIds((err, data) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        expect(data.length > 0).assertTure();
      }
      console.info(`inputDevice::getDeviceIds_test-02 exit`);
    })
  })

  it("inputDevice::getDevice_test-01", 0, function () {
    console.info(`inputDevice::getDevice_test-03 enter`);
    inputDevice.getDevice(-1, (err, data) => {
      if (err) {
        expect(false).assertTrue();
        console.info(`inputDevice::getDevice_test-03 ${JSON.stringify(err)}`);
      } else {
        expect(JSON.stringify(data) !== "{}").assertTrue();
      }
      console.info(`inputDevice::getDevice_test-03 exit`);
    })
  })

  // 参数正常,返回值正常
  it("inputDevice::getDevice_test-02", 0, function () {
    console.info(`inputDevice::getDevice_test-04 enter`);
    inputDevice.getDeviceIds((err, data) => {
      if (err) {
        expect(false).assertTrue();
      } else {
        let arr = [];
        for (let i = 0; i < data.length; i++) {
          inputDevice.getDevice(data[i], (res, err) => {
            console.info(`getDevice:data_i ${JSON.stringify(data[i])}`)
            console.info(`getDevice:data ${JSON.stringify(data)}`)
            console.info(`getDevice:err ${JSON.stringify(err)}`)
            arr = Object.keys(res);
          })
          expect(arr.length > 0).assertTrue();
        }
      }
      console.info(`inputDevice::getDevice_test-04 exit`);
    });
  })

  it("inputDevice::getDevice_test03", 0, async function () {
    console.info(`inputDevice::getDevice_test-04 enter`);
    await inputDevice.getDeviceIds((err, data) => {
      if (err) {
        expect(false).assertTrue();
        done();
      } else {
        let arr = [];
        for (let i = 0; i < data.length; i++) {
          inputDevice.getDevice(data[i], (res, err) => {
            console.info(`getDevice:data_i ${JSON.stringify(data[i])}`)
            console.info(`getDevice:data ${JSON.stringify(data)}`)
            console.info(`getDevice:err ${JSON.stringify(err)}`)
            arr = Object.keys(res);
            expect(res).assertInstanceOf('InputDeviceData');
            expect(res.id).assertInstanceOf('number');
            expect(res.sources).assertInstanceOf('string');
            expect(res.name).assertInstanceOf('Array');
            expect(res.axisRanges).assertInstanceOf('Array');
            for (let j = 0; j < res.sources.length; j++) {
              expect(res.sources[j]).assertInstanceOf('SourceType');
              expect(res.sources[j] == 'keyboard' || res.sources[j] == 'mouse' ||
                res.sources[j] == 'touchpad' || res.sources[j] == 'touchscreen' ||
                res.sources[j] == 'joystick' || res.sources[j] == 'trackball').assertTrue();
            }
            for (let k = 0; k < res.axisRanges.length; k++) {
              expect(res.axisRanges[i]).assertInstanceOf('AxisRange');
              expect(res.axisRanges[i].source).assertInstanceOf('SourceType');
              expect(res.axisRanges[i].axis).assertInstanceOf('AxisType');
              expect(res.axisRanges[i].axis == 'NULL').assertTrue();
              expect(res.axisRanges[i].max).assertInstanceOf('number');
              expect(res.axisRanges[i].min).assertInstanceOf('number');
            }
          })
          expect(arr.length > 0).assertTrue();
        }
      }
      console.info(`inputDevice::getDevice_test-04 exit`);
    });
  })

  /**
 * @tc.number MultimodalInputDevice_js_0070
 * @tc.name MultimodalInputDevice_getDeviceIds_Promise_test
 * @tc.desc inputdevice interface getDeviceIds & supportKeys test
 */
  it("MultimodalInputDevice_getDeviceIds_Promise_test", 0, async function () {
    console.info(`inputDevice::supportKeys_test-01 enter`);
    await inputDevice.getDeviceIds().then((data) => {
      console.info(`getDevice:data ${JSON.stringify(data)}`)
      for (let i = 0; i < data.length; ++i) {
        inputDevice.getDevice(data[i]).then((res) => {
          console.info(`getDevice:data_i ${JSON.stringify(data[i])}`)
          console.info(`getDevice:res ${JSON.stringify(res)}`)
          arr = Object.keys(res);
          expect(res.id).assertInstanceOf('number');
          expect(res.sources).assertInstanceOf('string');
          expect(res.name).assertInstanceOf('Array');
          expect(res.axisRanges).assertInstanceOf('Array');
          for (let j = 0; j < res.sources.length; j++) {
            expect(res.sources[j]).assertInstanceOf('SourceType');
            expect(res.sources[j] == 'keyboard' || res.sources[j] == 'mouse' ||
              res.sources[j] == 'touchpad' || res.sources[j] == 'touchscreen' ||
              res.sources[j] == 'joystick' || res.sources[j] == 'trackball').assertTrue();
          }
          for (let k = 0; k < res.axisRanges.length; k++) {
            expect(res.axisRanges[i]).assertInstanceOf('AxisRange');
            expect(res.axisRanges[i].source).assertInstanceOf('SourceType');
            expect(res.axisRanges[i].axis).assertInstanceOf('AxisType');
            expect(res.axisRanges[i].axis == 'NULL').assertTrue();
            expect(res.axisRanges[i].max).assertInstanceOf('number');
            expect(res.axisRanges[i].min).assertInstanceOf('number');
          }
          done();
        }, (err) => {
          if (err) {
            expect(false).assertTrue();
            console.info(`getDevice:err ${JSON.stringify(err)}`)
            done();
          }
        })
      }
      done();
      console.info(`inputDevice::supportKeys_test-01 exit`);
    }, (err) => {
      if (err) {
        expect(false).assertTrue();
        console.info(`getDevice:err ${JSON.stringify(err)}`)
        done();
      }
    });
  })
})
