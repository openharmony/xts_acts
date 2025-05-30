/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import fileio from '@ohos.fileio'
import request from "@ohos.request";
import featureAbility from '@ohos.ability.featureAbility';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "@ohos/hypium";

export default function requestUploadJSUnit() {
  describe('requestUploadTest', () => {
    console.info('====>################################request upload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: Function) => {
      try {
        let context: featureAbility.Context = featureAbility.getContext();
        console.info(`====>beforeAll: getCacheDir context success`);
        let pathDir = await context.getCacheDir();
        console.info(`====>beforeAll: getCacheDir data: ${pathDir}`);
        let filePath = pathDir + `/test.txt`;
        console.info(`====>beforeAll: filePath data: ${filePath}`);
        let fd = fileio.openSync(filePath, 0o100 | 0o2, 0o666);
        let content = ''.padEnd(1 * 1024 *1024, 'h');
        fileio.writeSync(fd, content);
        fileio.closeSync(fd);
        console.info('====>beforeAll: text.txt file generate');
        done();
      } catch (err) {
        console.info('====>beforeAll: text.txt file generate failed' + err);
        done();
      }
    })

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(() => {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(() => {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(() => {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    let uploadTask: request.UploadTask;
    let RequestData: ESObject = {
      name: 'name',
      value: '123'
    }

    let File: request.File = {
      filename: 'test',
      name: 'test',
      uri: 'internal://cache/test.txt',
      type: 'txt'
    }

    let uploadConfig: request.UploadConfig = {
      url: 'http://127.0.0.1',
      header: {
        headers: 'http'
      },
      method: 'POST',
      files: [File],
      data: [RequestData]
    };

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_0001
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_UPLOAD_API_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0001 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0001 request.NETWORK_MOBILE:" + request.NETWORK_MOBILE);
        expect(request.NETWORK_MOBILE).assertEqual(1);
        console.info("====>SUB_REQUEST_UPLOAD_API_0001 request.NETWORK_WIFI:" + request.NETWORK_WIFI);
        expect(request.NETWORK_WIFI).assertEqual(65536);
        console.info("====>SUB_REQUEST_UPLOAD_API_0001 request.ERROR_CANNOT_RESUME:" + request.ERROR_CANNOT_RESUME);
        expect(request.ERROR_CANNOT_RESUME).assertEqual(0);
        console.info("====>SUB_REQUEST_UPLOAD_API_0001 request.ERROR_DEVICE_NOT_FOUND:" + request.ERROR_DEVICE_NOT_FOUND);
        expect(request.ERROR_DEVICE_NOT_FOUND).assertEqual(1);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_0001 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0001 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_0002
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_UPLOAD_API_0002', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0002 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0002 request.ERROR_FILE_ALREADY_EXISTS:" + request.ERROR_FILE_ALREADY_EXISTS);
        expect(request.ERROR_FILE_ALREADY_EXISTS).assertEqual(2);
        console.info("====>SUB_REQUEST_UPLOAD_API_0002 request.ERROR_FILE_ERROR:" + request.ERROR_FILE_ERROR);
        expect(request.ERROR_FILE_ERROR).assertEqual(3);
        console.info("====>SUB_REQUEST_UPLOAD_API_0002 request.ERROR_HTTP_DATA_ERROR:" + request.ERROR_HTTP_DATA_ERROR);
        expect(request.ERROR_HTTP_DATA_ERROR).assertEqual(4);
        console.info("====>SUB_REQUEST_UPLOAD_API_0002 request.ERROR_INSUFFICIENT_SPACE:" + request.ERROR_INSUFFICIENT_SPACE);
        expect(request.ERROR_INSUFFICIENT_SPACE).assertEqual(5);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_0002 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0002 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_0003
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_UPLOAD_API_0003', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0003 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0003 request.ERROR_TOO_MANY_REDIRECTS:" + request.ERROR_TOO_MANY_REDIRECTS);
        expect(request.ERROR_TOO_MANY_REDIRECTS).assertEqual(6);
        console.info("====>SUB_REQUEST_UPLOAD_API_0003 request.ERROR_UNHANDLED_HTTP_CODE:" + request.ERROR_UNHANDLED_HTTP_CODE);
        expect(request.ERROR_UNHANDLED_HTTP_CODE).assertEqual(7);
        console.info("====>SUB_REQUEST_UPLOAD_API_0003 request.ERROR_UNKNOWN:" + request.ERROR_UNKNOWN);
        expect(request.ERROR_UNKNOWN).assertEqual(8);
        console.info("====>SUB_REQUEST_UPLOAD_API_0003 request.PAUSED_QUEUED_FOR_WIFI:" + request.PAUSED_QUEUED_FOR_WIFI);
        expect(request.PAUSED_QUEUED_FOR_WIFI).assertEqual(0);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_0003 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0003 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_0004
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_UPLOAD_API_0004', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0004 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0004 request.PAUSED_UNKNOWN:" + request.PAUSED_UNKNOWN);
        expect(request.PAUSED_UNKNOWN).assertEqual(4);
        console.info("====>SUB_REQUEST_UPLOAD_API_0004 request.PAUSED_WAITING_FOR_NETWORK:" + request.PAUSED_WAITING_FOR_NETWORK);
        expect(request.PAUSED_WAITING_FOR_NETWORK).assertEqual(1);
        console.info("====>SUB_REQUEST_UPLOAD_API_0004 request.PAUSED_WAITING_TO_RETRY:" + request.PAUSED_WAITING_TO_RETRY);
        expect(request.PAUSED_WAITING_TO_RETRY).assertEqual(2);
        console.info("====>SUB_REQUEST_UPLOAD_API_0004 request.PAUSED_BY_USER:" + request.PAUSED_BY_USER);
        expect(request.PAUSED_BY_USER).assertEqual(3);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_0004 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0004 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_0005
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_UPLOAD_API_0005', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0005 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0005 request.SESSION_FAILED:" + request.SESSION_FAILED);
        expect(request.SESSION_FAILED).assertEqual(4);
        console.info("====>SUB_REQUEST_UPLOAD_API_0005 request.SESSION_PAUSED:" + request.SESSION_PAUSED);
        expect(request.SESSION_PAUSED).assertEqual(3);
        console.info("====>SUB_REQUEST_UPLOAD_API_0005 request.SESSION_PENDING:" + request.SESSION_PENDING);
        expect(request.SESSION_PENDING).assertEqual(2);
        console.info("====>SUB_REQUEST_UPLOAD_API_0005 request.SESSION_RUNNING:" + request.SESSION_RUNNING);
        expect(request.SESSION_RUNNING).assertEqual(1);
        console.info("====>SUB_REQUEST_UPLOAD_API_0005 request.SESSION_SUCCESSFUL:" + request.SESSION_SUCCESSFUL);
        expect(request.SESSION_SUCCESSFUL).assertEqual(0);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_0005 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0005 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_0006
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_UPLOAD_API_0006', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0006 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.EXCEPTION_PERMISSION:" + request.EXCEPTION_PERMISSION);
        expect(request.EXCEPTION_PERMISSION).assertEqual(201);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.EXCEPTION_PARAMCHECK:" + request.EXCEPTION_PARAMCHECK);
        expect(request.EXCEPTION_PARAMCHECK).assertEqual(401);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.EXCEPTION_UNSUPPORTED:" + request.EXCEPTION_UNSUPPORTED);
        expect(request.EXCEPTION_UNSUPPORTED).assertEqual(801);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.EXCEPTION_FILEIO:" + request.EXCEPTION_FILEIO);
        expect(request.EXCEPTION_FILEIO).assertEqual(13400001);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.EXCEPTION_FILEPATH:" + request.EXCEPTION_FILEPATH);
        expect(request.EXCEPTION_FILEPATH).assertEqual(13400002);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.EXCEPTION_SERVICE:" + request.EXCEPTION_SERVICE);
        expect(request.EXCEPTION_SERVICE).assertEqual(13400003);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.EXCEPTION_OTHERS:" + request.EXCEPTION_OTHERS);
        expect(request.EXCEPTION_OTHERS).assertEqual(13499999);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.ERROR_OFFLINE:" + request.ERROR_OFFLINE);
        expect(request.ERROR_OFFLINE).assertEqual(9);
        console.info("====>SUB_REQUEST_UPLOAD_API_0006 request.ERROR_UNSUPPORTED_NETWORK_TYPE:" + request.ERROR_UNSUPPORTED_NETWORK_TYPE);
        expect(request.ERROR_UNSUPPORTED_NETWORK_TYPE).assertEqual(10);
      } catch (err) {
        expect().assertFail();
        console.error("====>SUB_REQUEST_UPLOAD_API_0006 error: " + err);
      }
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0006 end-----------------------");
      done();
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_CALLBACK_0001
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_UPLOAD_API_CALLBACK_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_CALLBACK_0001 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_CALLBACK_0001 uploadConfig = " + JSON.stringify(uploadConfig));
        request.upload(uploadConfig, (err, uploadTask) => {
          console.info("====>SUB_REQUEST_UPLOAD_API_CALLBACK_0001 progress uploadTask =" + JSON.stringify(uploadTask));
          expect(uploadTask != undefined).assertEqual(true);
          let progress_callback = (data1: number, data2: number) => {
            console.info("====>SUB_REQUEST_UPLOAD_API_CALLBACK_0001 off data1 =" + data1);
            console.info("====>SUB_REQUEST_UPLOAD_API_CALLBACK_0001 off data2 =" + data2);
          }
          uploadTask.on('progress', progress_callback);

          uploadTask.off('progress', progress_callback);

          uploadTask.remove((err, data) => {
            console.info("====>SUB_REQUEST_UPLOAD_API_CALLBACK_0001 remove =" + data);
            expect(data).assertEqual(true);
            console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_CALLBACK_0001 end-----------------------");
            done();
          });
        });
      } catch (err) {
        console.error("====>SUB_REQUEST_UPLOAD_API_CALLBACK_0001 error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_REQUEST_UPLOAD_API_PROMISE_0001
     * @tc.name      : Use getEntries get the value by mixing the string key
     * @tc.desc      : Mixed strings value can be obtained correctly
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_UPLOAD_API_PROMISE_0001', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_PROMISE_0001 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0001 UploadConfig = " + JSON.stringify(uploadConfig));
        request.upload(uploadConfig).then((uploadTask) => {
          console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0001 uploadTask = " + uploadTask);
          expect(true).assertEqual((uploadTask != undefined));
          let headerReceive_callback = (header: object) => {
            console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0001 header = " + header);
            expect(true).assertEqual((JSON.stringify(header) !== '{}' || header !== undefined));
          }
          uploadTask.on('headerReceive', headerReceive_callback);

          uploadTask.off('headerReceive',headerReceive_callback);

          uploadTask.remove().then((result)=>{
            console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0001 remove result = " + result);
            expect(result).assertEqual(true);
            console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_PROMISE_0001 end-----------------------");
            done();
          });
        });
      } catch (e) {
        console.error("====>SUB_REQUEST_UPLOAD_API_PROMISE_0001 error: " + JSON.stringify(e));
        expect(true).assertFail(true);
      }
    });

    /**
     * @tc.number    : SUB_REQUEST_UPLOAD_API_0007
     * @tc.name      : Use getEntries get the value by mixing the string key
     * @tc.desc      : Mixed strings value can be obtained correctly
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_UPLOAD_API_0007', Level.LEVEL2, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0007 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0007 UploadConfig = " + JSON.stringify(uploadConfig));
        request.upload(uploadConfig).then((uploadTask) => {
          console.info("====>SUB_REQUEST_UPLOAD_API_0007 uploadTask = " + uploadTask);
          expect(true).assertEqual((uploadTask != undefined));
          let complete_callback = (taskStates: Array<request.TaskState>) => {
            console.info("====>SUB_REQUEST_UPLOAD_API_0007 off_complete");
          }

          uploadTask.on('complete', complete_callback);

          uploadTask.off('complete', complete_callback);

          uploadTask.remove().then((result)=>{
            console.info("====>SUB_REQUEST_UPLOAD_API_0007 remove result = " + result);
            expect(result).assertEqual(true);
            console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0007 end-----------------------");
            done();
          });
        });
      } catch (e) {
        console.error("====>SUB_REQUEST_UPLOAD_API_0007 error: " + JSON.stringify(e));
        expect().assertFail();
      }
    });


    /**
     * @tc.number    : SUB_REQUEST_UPLOAD_API_0008
     * @tc.name      : Use getEntries get the value by mixing the string key
     * @tc.desc      : Mixed strings value can be obtained correctly
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_REQUEST_UPLOAD_API_0008', Level.LEVEL0, async (done: Function) => {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0008 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_0008 UploadConfig = " + JSON.stringify(uploadConfig));
        request.upload(uploadConfig).then((uploadTask) => {
          console.info("====>SUB_REQUEST_UPLOAD_API_0008 uploadTask = " + uploadTask);
          expect(true).assertEqual((uploadTask != undefined));
          let fail_callback = (taskStates: Array<request.TaskState>) => {
            console.info("====>SUB_REQUEST_UPLOAD_API_0008 on_fail");
          }
          uploadTask.on('fail', fail_callback);

          uploadTask.off('fail', fail_callback);

          uploadTask.remove().then((result)=>{
            console.info("====>SUB_REQUEST_UPLOAD_API_0008 remove result = " + result);
            expect(result).assertEqual(true);
            console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_0008 end-----------------------");
            done();
          });
        });
      } catch (e) {
        console.error("====>SUB_REQUEST_UPLOAD_API_0008 error: " + JSON.stringify(e));
        expect().assertFail();
      }
    });

  })
}
