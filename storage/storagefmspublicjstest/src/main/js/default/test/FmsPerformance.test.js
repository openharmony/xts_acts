/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import fileio from '@ohos.fileio';
import filepicker from '@ohos.filepicker'
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect
}
from 'deccjsunit/index'
import {
  FILE_CONTENT,
  prepareFile,
  fileName,
  filePickerName,
  filePickerName2,
  sleep,
  randomString,
  cacheFileName,
  prepareEmptyFile,
  nextFileName
}
from './Common'
describe('FmsPerformanceTest', function () {
  let deviceID = 0;
  /**
   * @tc.number SUB_STORAGE_FMS_Stability_0000
   * @tc.name FMS_Stability_0000
   * @tc.desc Function of API,Performance Test
   */
  it('FMS_Performance_0000', 0,  function (done) {
    let start = new Date().getTime();
    for (let i = 0; i < 1000; i++){
      let progetDeviceInfo = new Promise(function (resolve, reject) {
        for (let i = 0; i < 1000; i++){}
        filepicker.getDeviceInfo({
          success: function (data) {
            let end = new Date().getTime();
            let time = end - start;
            console.log('-------FMS_Performance_0000  success, time:' + time + ',' + i);
            start = new Date().getTime();
            console.log('FMS_Function_0000 success.' + JSON.stringify(data));
            deviceID = data.deviceList[0].deviceID;
            done()
          },
          fail: function (data, code) {
            console.log('FMS_Function_0000 fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        })
      })
      progetDeviceInfo.then(function () {
        console.log('FMS_Function_0000 success');
      });
    }
  })

  /**
   * @tc.number SUB_STORAGE_FMS_Performance_0100
   * @tc.name FMS_Performance_0100
   * @tc.desc Function of API,Performance Test
   */
  it('FMS_Performance_0100', 0,  function (done) {
    let start = new Date().getTime();
    for (let i = 0; i < 1000; i++){
      let proMkdir = new Promise(function (resolve, reject) {
        filepicker.mkdir({
          uri: 'dataability:///public.storage.ability/' + deviceID + '/document/fms_test/leaf',
          success: function () {
            let end = new Date().getTime();
            let time = end - start;
            console.log('-------FMS_Performance_0100 success, time:' + time + ',' + i);
            start = new Date().getTime();
            console.log('FMS_Performance_0100 success.');
            done()
          },
          fail: function (data, code) {
            console.log('FMS_Performance_0100 fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        })
      })
      proMkdir.catch(function () {
        console.log('FMS_Performance_0100 success');
      });
    }
  })

  /**
   * @tc.number SUB_STORAGE_FMS_Performance_0200
   * @tc.name FMS_Performance_0200
   * @tc.desc Function of API,Performance Test
   */
  it('FMS_Performance_0200', 0,  function (done) {
    let start = new Date().getTime();
    for (let i = 0; i < 1000; i++){
      let proMkdir = new Promise(function (resolve, reject) {
        filepicker.mkdir({
          uri: 'dataability:///public.storage.ability/' + deviceID + '/document/a/b/c/leaf',
          success: function () {
            let end = new Date().getTime();
            let time = end - start;
            console.log('-------FMS_Performance_0200 success, time:' + time + ',' + i);
            start = new Date().getTime();
            console.log('FMS_Performance_0200 success.');
            done()
          },
          fail: function (data, code) {
            console.log('FMS_Performance_0200 fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        })
      })
      proMkdir.catch(function () {
        console.log('FMS_Performance_0200 success');
      });
    }
  })

  /**
   * @tc.number SUB_STORAGE_FMS_Performance_0300
   * @tc.name FMS_Performance_0300
   * @tc.desc Function of API,Performance Test
   */
  it('FMS_Performance_0300', 0,  function (done) {
    let fpath = filePickerName("a.txt", deviceID);
    prepareFile(fpath, FILE_CONTENT)
    let start = new Date().getTime();
    for (let i = 0; i < 1000; i++){
      let proMkdir = new Promise(function (resolve, reject) {
        filepicker.saveFile({
          srcUri: ['dataability:///public.storage.ability/' + deviceID + '/document/fms_test/a.txt/leaf'],
          dstUri: 'dataability:///public.storage.ability/' + deviceID + '/root',
          success: function (data) {
            let end = new Date().getTime();
            let time = end - start;
            console.log('-------FMS_Performance_0300 success, time:' + time + ',' + i);
            start = new Date().getTime();
            console.log('FMS_Performance_0300 success.' + data.saveFileList[0].status);
            done()
          },
          fail: function (data, code) {
            console.log('FMS_Performance_0300 fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
        setTimeout(function () {
          resolve('mkdir success!');
          done()
        }, 250);
      })
      proMkdir.then(function () {
        console.log('FMS_Performance_0300 success');
      });
    }
  })

  /**
   * @tc.number SUB_STORAGE_FMS_Performance_0400
   * @tc.name FMS_Performance_0400
   * @tc.desc Function of API,Performance Test
   */
  it('FMS_Performance_0400', 0,  function (done) {
    let start = new Date().getTime();
    for (let i = 0; i < 1000; i++){
      let proMkdir = new Promise(function (resolve, reject) {
        filepicker.searchFile({
          uri: 'dataability:///public.storage.ability/' + deviceID + '/document/fms_test/leaf',
          name: 'a.txt',
          success: function (data) {
            let end = new Date().getTime();
            let time = end - start;
            console.log('-------FMS_Performance_0400 success, time:' + time + ',' + i);
            start = new Date().getTime();
            console.log('FMS_Performance_0400 success.' + data.fileList[0].uri);
            done()
          },
          fail: function (data, code) {
            console.log('FMS_Performance_0400 fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      })
      proMkdir.then(function () {
        console.log('FMS_Performance_0400 success');
      });
    }
  })

  /**
   * @tc.number SUB_STORAGE_FMS_Performance_0500
   * @tc.name FMS_Performance_0500
   * @tc.desc Function of API,Performance Test
   */
  it('FMS_Performance_0500', 0,  function (done) {
    let start = new Date().getTime();
    for (let i = 0; i < 1000; i++){
      let proMkdir = new Promise(function (resolve, reject) {
        filepicker.list({
          uri: 'dataability:///public.storage.ability/' + deviceID + '/document/fms_test/leaf',
          success: function (data) {
            let end = new Date().getTime();
            let time = end - start;
            console.log('-------FMS_Performance_0500 success, time:' + time + ',' + i);
            start = new Date().getTime();
            console.log('FMS_Performance_0500 success.' + data.fileList[0].uri);
            done()
          },
          fail: function (data, code) {
            console.log('FMS_Performance_0500 fail, code: ' + code + ', data: ' + data);
            expect(null).assertFail();
          },
        });
      })
      proMkdir.then(function () {
        console.log('FMS_Performance_0500 success');
      });
    }
  })

})