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

import request from "@ohos.request";
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestUploadJSUnit() {
  describe('requestUploadJSUnit', function () {
    console.info('====>################################request upload Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info('====>beforeAll: Prerequisites are executed.');
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });

    /**
     * sleep function.
     */
    function sleep(date, time){
      while(Date.now() - date <= time);
    }

    let uploadTask;
    let RequestData = {
      name: 'name',
      value: '123'
    }

    let File = {
      filename: 'test',
      name: 'test',
      uri: 'internal://cache/test.txt',
      type: 'txt'
    }

    let uploadConfig = {
      url: 'http://127.0.0.1',
      header: {
        headers: 'http'
      },
      method: 'POST',
      files: [File],
      data: [RequestData]
    };

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001
     * @tc.name      Test requestUploadTest type = TIMER_TYPE_REALTIME
     * @tc.desc      Test requestUploadTest API functionality.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001', 0, async function (done) {
      console.info("====>------------------SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 uploadConfig = " + JSON.stringify(uploadConfig));
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        request.upload(globalThis.abilityContext, uploadConfig, (err, data) => {
          uploadTask = data;
          console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 progress uploadTask =" + JSON.stringify(uploadTask));
          console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 progress uploadTask =" + uploadTask);
          expect(true).assertEqual(uploadTask != undefined);

          uploadTask.on('progress', function (data1, data2) {
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 on data1 =" + data1);
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 on data2 =" + data2);
          });

          uploadTask.off('progress', function (data1, data2) {
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 off data1 =" + data1);
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 off data2 =" + data2);
          });

          uploadTask.remove((err, data) => {
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 remove =" + data);
          });
        });
      } catch (err) {
        console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 error: " + err);
        expect().assertFail();
      }
      setTimeout(()=>{
        console.info("====>------------------SUB_REQUEST_UPLOAD_STAGE_API_CALLBACK_0001 end-----------------------");
        done();
      }, 10000) 
    });

    /*
        * @tc.number    : SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001
        * @tc.name      : Use getEntries get the value by mixing the string key
        * @tc.desc      : Mixed strings value can be obtained correctly
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 1
    */
    it('SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001', 0, async function (done) {
      console.info("====>------------------SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 UploadConfig = " + JSON.stringify(uploadConfig));
        let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        request.upload(globalThis.abilityContext, uploadConfig).then((data) => {
          uploadTask = data;
          console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 uploadTask = " + uploadTask);
          expect(true).assertEqual(uploadTask != undefined);

          uploadTask.on('headerReceive', (header) => {
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 header = " + header);
            expect(true).assertEqual((header != undefined) || (header != "") || (header != {}));
          });

          uploadTask.off('headerReceive', (header) => {
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 header = " + header);
            expect(true).assertEqual((header != undefined) || (header != "") || (header != {}));
          });

          uploadTask.remove().then((result)=>{
            console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 remove result = " + result);
            expect(result).assertEqual(true);
          });
        });
      } catch (e) {
        console.info("====>SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 error: " + JSON.stringify(e));
        expect(e).assertFail();
      }
      setTimeout(()=>{
        console.info("====>------------------SUB_REQUEST_UPLOAD_STAGE_API_PROMISE_0001 end-----------------------");
        done();
      }, 10000) 
    });

    /**
     * @tc.number    : SUB_REQUEST_UPLOAD_API_PROMISE_0002
     * @tc.name      : Use getEntries get the value by mixing the string key
     * @tc.desc      : Called when the current upload session complete or fail.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_UPLOAD_API_PROMISE_0002', 0, async function (done) {
      console.info("====>------------------SUB_REQUEST_UPLOAD_API_PROMISE_0002 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 UploadConfig = " + JSON.stringify(uploadConfig));
        request.upload(globalThis.abilityContext, uploadConfig).then((data) => {
          try{
            uploadTask = data;
            console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 uploadTask = " + uploadTask);
            expect(true).assertEqual((uploadTask != undefined) || (uploadTask != "") || (uploadTask != {}));

            uploadTask.on('complete', (TaskState) => {
              for(let i = 0; i < TaskState.length; i++){
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 complete TaskState = " + JSON.stringify(TaskState[i]))
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 complete TaskState.path = " + TaskState[i].path);
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 complete TaskState.responseCode = " + TaskState[i].responseCode);
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 complete TaskState.TaskState.message = " + TaskState[i].message);
                expect(typeof(TaskState[i].path) == "string").assertEqual(true);
                expect(typeof(TaskState[i].responseCode) == "number").assertEqual(true);
                expect(typeof(TaskState[i].message) == "string").assertEqual(true);
              }
              done();
            });

            uploadTask.on('fail', (TaskState) => {
              for(let i = 0; i < TaskState.length; i++){
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 fail TaskState = " + JSON.stringify(TaskState[i]))
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 fail TaskState.path = " + TaskState[i].path);
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 fail TaskState.responseCode = " + TaskState[i].responseCode);
                console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 fail TaskState.TaskState.message = " + TaskState[i].message);
                expect(typeof(TaskState[i].path) == "string").assertEqual(true);
                expect(typeof(TaskState[i].responseCode) == "number").assertEqual(true);
                expect(typeof(TaskState[i].message) == "string").assertEqual(true);
              }              
              expect(true).assertEqual(true);
            });
          }catch(err){
             console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 error: " + JSON.stringify(err));
          expect(true).assertFail(true);
          }          
        }).catch((err)=>{
          console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 error: " + JSON.stringify(err));
          expect(true).assertFail(true);
        })
      } catch (e) {
        console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0002 throw_error: " + JSON.stringify(e));
        expect(true).assertFail(true);
      }
      setTimeout(()=>{
        console.info("====>------------------SUB_REQUEST_UPLOAD_API_PROMISE_0002 end-----------------------");
        done();
      }, 10000)      
    });

    /**
     * @tc.number    : SUB_REQUEST_UPLOAD_API_PROMISE_0003
     * @tc.name      : Use getEntries get the value by mixing the string key
     * @tc.desc      : Called when the current upload session complete or fail.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_REQUEST_UPLOAD_API_PROMISE_0003', 0, async function (done) {
      console.info("====>------------------SUB_REQUEST_UPLOAD_API_PROMISE_0003 is starting-----------------------");
      try {
        console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0003 UploadConfig = " + JSON.stringify(uploadConfig));
        request.upload(globalThis.abilityContext, uploadConfig).then((data) => {
          try{
            uploadTask = data;
            console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0003 uploadTask = " + uploadTask);
            expect(true).assertEqual((uploadTask != undefined) || (uploadTask != "") || (uploadTask != {}));

            uploadTask.off('complete', () => {
              console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0003 TaskState success");
              expect(true).assertEqual(true);
            });

            uploadTask.off('fail', () => {
              console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0003 TaskState success");
              expect(true).assertEqual(true);
            });
          }catch(err){
            expect().assertFail();
            done();
          }
          
        });
      } catch (e) {
        console.info("====>SUB_REQUEST_UPLOAD_API_PROMISE_0003 error: " + JSON.stringify(e));
        expect(true).assertFail(true);
      }
     setTimeout(()=>{
        console.info("====>------------------SUB_REQUEST_UPLOAD_API_PROMISE_0003 end-----------------------");
        done();
      }, 10000)
    });
  })
}
