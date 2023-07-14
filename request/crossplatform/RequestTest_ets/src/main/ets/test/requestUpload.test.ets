/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

export default function requestUploadJSUnit() {
  describe("requestUploadJSUnit", function () {
    console.info("====>################################request upload Test start");

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(function () {
      console.info("====>beforeAll: Prerequisites are executed.");
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach(function () {
      console.info("====>beforeEach: Prerequisites is executed.");
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach(function () {
      console.info("====>afterEach: Test case-level clearance conditions is executed.");
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll(function () {
      console.info("====>afterAll: Test suite-level cleanup condition is executed");
    });

    let RequestData = {
      name: "name",
      value: "123",
    };

    let File = {
      filename: "test",
      name: "test",
      uri: "internal://cache/test.txt",
      type: "txt",
    };

    let uploadConfig = {
      url: "http://127.0.0.1",
      header: {
        headers: "http",
      },
      method: "POST",
      files: [File],
      data: [RequestData],
    };

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_DELETE_0001
     * *@tc.name     subRequestUploadApiDelete0001
     * @tc.desc      upload file and delete the upload task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestUploadApiDelete0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_DELETE_0001 is starting-----------------------");
      request.uploadFile(globalThis.abilityContext, uploadConfig, (err, uploadTask) => {
        try {
          console.info("====>SUB_REQUEST_UPLOAD_API_DELETE_0001 uploadTask: " + uploadTask);
          expect(uploadTask != undefined).assertEqual(true);
          uploadTask.delete((err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_UPLOAD_API_DELETE_0001 Failed to delete the uploadTask task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_UPLOAD_API_DELETE_0001 uploadTask task delete success.");
              expect(typeof data == "boolean").assertTrue();
              console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_DELETE_0001 end-----------------------");
              done();
            } catch (err) {
              console.error("====>SUB_REQUEST_UPLOAD_API_DELETE_0001 delete error" + err);
              done();
            }
          });
        } catch (error) {
          console.error("====>SUB_REQUEST_UPLOAD_API_DELETE_0001 delete catch error" + error);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_DELETE_0002
     * *@tc.name     subRequestUploadApiDelete0002
     * @tc.desc      upload file and delete the upload task (Promise).
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestUploadApiDelete0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_DELETE_0002 is starting-----------------------");
      request.uploadFile(globalThis.abilityContext, uploadConfig).then((uploadTask) => {
        console.info("====>SUB_REQUEST_UPLOAD_API_DELETE_0002 uploadTask: " + uploadTask);
        try {
          expect(uploadTask != undefined).assertEqual(true);
          uploadTask
            .delete()
            .then((data) => {
              console.info("====>SUB_REQUEST_UPLOAD_API_DELETE_0002 delete data:" + JSON.stringify(data));
              expect(data).assertEqual(true);
              done();
            })
            .catch((err) => {
              console.info("====>SUB_REQUEST_UPLOAD_API_DELETE_0002 Failed to delete the uploadTask task.");
              expect().assertFail();
              done();
            });
        } catch (err) {
          console.error("====>SUB_REQUEST_UPLOAD_API_DELETE_0002 delete catch err");
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_EVENT_0001
     * *@tc.name     subRequestUploadApiEvent0001
     * @tc.desc      upload file and test event.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestUploadApiEvent0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_EVENT_0001 is starting-----------------------");
      request.uploadFile(globalThis.abilityContext, uploadConfig).then((uploadTask) => {
        console.info("====>SUB_REQUEST_UPLOAD_API_EVENT_0001 uploadTask: " + uploadTask);
        try {
          expect(uploadTask != undefined).assertEqual(true);
          uploadTask.on("progress", (uploadedSize, totalSize) => {
            expect(uploadedSize != undefined).assertEqual(true);
            expect(totalSize != undefined).assertEqual(true);
            uploadTask.off("progress", (uploadedSize, totalSize) => {
              expect(uploadedSize != undefined).assertEqual(true);
              expect(totalSize != undefined).assertEqual(true);
            });
          });
          done();
        } catch (err) {
          console.error("====>SUB_REQUEST_UPLOAD_API_EVENT_0001 delete catch err");
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_EVENT_0002
     * *@tc.name     subRequestUploadApiEvent0002
     * @tc.desc      upload file and test event.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestUploadApiEvent0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_EVENT_0002 is starting-----------------------");
      request.uploadFile(globalThis.abilityContext, uploadConfig).then((uploadTask) => {
        console.info("====>SUB_REQUEST_UPLOAD_API_EVENT_0002 uploadTask: " + uploadTask);
        try {
          expect(uploadTask != undefined).assertEqual(true);
          uploadTask.on("headerReceive", (header) => {
            expect(header != undefined).assertEqual(true);
            uploadTask.off("headerReceive", (header) => {
              expect(header != undefined).assertEqual(true);
            });
          });
          done();
        } catch (err) {
          console.error("====>SUB_REQUEST_UPLOAD_API_EVENT_0002 delete catch err");
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_UPLOAD_API_EVENT_0003
     * *@tc.name     subRequestUploadApiEvent0003
     * @tc.desc      upload file and test event.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestUploadApiEvent0003", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_UPLOAD_API_EVENT_0003 is starting-----------------------");
      request.uploadFile(globalThis.abilityContext, uploadConfig).then((uploadTask) => {
        console.info("====>SUB_REQUEST_UPLOAD_API_EVENT_0003 uploadTask: " + uploadTask);
        try {
          expect(uploadTask != undefined).assertEqual(true);
          uploadTask.on("complete", (taskStates) => {
            const task = taskStates.length != 0 ? taskStates[0] : null;
            if (task) {
              expect(task.path != null).assertEqual(true);
              expect(task.responseCode != null).assertEqual(true);
              expect(task.message != null).assertEqual(true);
            } else {
              console.info("SUB_REQUEST_UPLOAD_API_EVENT_0003: task is null");
              expect().assertFail();
              done();
            }

            uploadTask.off("complete", (taskStates) => {
              expect(taskStates != undefined).assertEqual(true);
            });
          });
          done();
        } catch (err) {
          console.error("====>SUB_REQUEST_UPLOAD_API_EVENT_0003 delete catch err");
          done();
        }
      });
    });
  });
}
