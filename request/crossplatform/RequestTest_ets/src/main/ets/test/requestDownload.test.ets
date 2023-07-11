/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import fileIo from "@ohos.file.fs";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";

const removeFile = (filePath: string): void => {
  if (fileIo.accessSync(filePath)) fileIo.unlinkSync(filePath);
};

export default function requestDownloadJSUnit() {
  describe("requestDownloadJSUnit", function () {
    console.info("====>################################request download Test start");

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

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_FILE_STAGE_API_CALLBACK_0001
     * *@tc.name     subRequestDownloadFileStageApiCallback0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadFileStageApiCallback0001", 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
        } catch (e) {
          console.info("====>SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 except error: " + e);
        }
        await downloadTask.delete();
        removeFile(downloadFilePath);
        console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 end-----------------------");
        done();
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_FILE_STAGE_API_PROMISE_0001
     * *@tc.name     subRequestDownloadFileStageApiPromise0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadFileStageApiPromise0001", 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      try {
        request
          .downloadFile(globalThis.abilityContext, downloadFileConfig)
          .then(async (downloadTask) => {
            console.info("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 downloadTask: " + downloadTask);
            expect(downloadTask != undefined).assertEqual(true);
            await downloadTask.delete();
          })
          .catch((err) => {
            console.error("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 error: " + err);
          })
          .finally(() => {
            removeFile(downloadFilePath);
            done();
          });
      } catch (err) {
        console.error("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 catch error: " + err);
        done();
      }
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_DELETE_0001
     * *@tc.name     subRequestDownloadApiDelete0001
     * @tc.desc      Delete the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiDelete0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_delete_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.delete(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 Failed to delete the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 Download task delete success.");
              expect(typeof data == "boolean").assertTrue();
            } catch (err) {
              console.error("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 delete throw error" + err);
            } finally {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            }
          });
        } catch (error) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 delete catch error" + error);
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_DELETE_0002
     * *@tc.name     subRequestDownloadApiDelete0002
     * @tc.desc      Delete the download task.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiDelete0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask
            .delete()
            .then(async (data) => {
              console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Download task delete success.");
              expect(data).assertEqual(true);
              console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 end-----------------------");
            })
            .catch(async (err) => {
              console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Failed to delete the download task.");
              expect().assertFail();
            })
            .finally(async () => {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
        } catch (error) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 delete catch error");
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_SUSPEND_0001
     * *@tc.name     subRequestDownloadApiSuspend0001
     * @tc.desc      Suspend the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiSuspend0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.suspend(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 Failed to suspend the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 Download task suspend success.");
              expect(data == true).assertTrue();
            } catch (err) {
              console.error("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 throw_error: " + JSON.stringify(err));
            }
            await downloadTask.delete();
            removeFile(downloadFilePath);
            done();
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 suspend catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_SUSPEND_0002
     * *@tc.name     subRequestDownloadApiSuspend0002
     * @tc.desc      Suspend the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiSuspend0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          try {
            let data = await downloadTask.suspend();
            expect(data == true).assertTrue();
          } catch (err) {
            console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 throw_err:" + JSON.stringify(err));
          }
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 suspend catch error" + JSON.stringify(err));
        } finally {
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_RESTORE_0001
     * *@tc.name     subRequestDownloadApiRestore0001
     * @tc.desc      Restore the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiRestore0001", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.restore(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 Failed to restore the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 Download  restore success.");
              expect(data == true).assertTrue();
            } catch (err) {
              console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 throw_err:" + JSON.stringify(err));
            }
            await downloadTask.delete();
            removeFile(downloadFilePath);
            done();
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 restore catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_RESTORE_0002
     * *@tc.name     subRequestDownloadApiRestore0002
     * @tc.desc      Restore the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiRestore0002", 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask
            .restore()
            .then(async (data) => {
              console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 Download task restore.");
              expect(data == true).assertTrue();
              await downloadTask.delete();
            })
            .catch(async (err) => {
              console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 Failed to restore the download task.");
            })
            .finally(async () => {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 restore catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_GETTASKINFO_0001
     * *@tc.name     subRequestDownloadApiGetTaskInfo0001
     * @tc.desc      Get the download task info
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiGetTaskInfo0001", 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 Failed to getTaskInfo the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 Download getTaskInfo success.");
              expect(typeof data == "object").assertTrue();
            } catch (err) {
              console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 throw_error" + JSON.stringify(err));
            }
            await downloadTask.delete();
            removeFile(downloadFilePath);
            done();
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_GETTASKINFO_0002
     * *@tc.name     subRequestDownloadApiGetTaskInfo0002
     * @tc.desc      Get the download task info
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiGetTaskInfo0002", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask
            .getTaskInfo()
            .then(async (data) => {
              console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Download task getTaskInfo success.");
              expect(typeof data == "object").assertTrue();
            })
            .catch(async (err) => {
              console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Failed to getTaskInfo the download task.");
            })
            .finally(async () => {
              await downloadTask.delete();
              removeFile(downloadFilePath);
              done();
            });
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNLOAD_API_GETTASKMINETYPE_0002
     * *@tc.name     subRequestDownloadApigetTaskMimeType0002
     * @tc.desc      Get mimetype of the download task
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApigetTaskMimeType0002", 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKMINETYPE_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMINETYPE_0002.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMINETYPE_0002.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };

      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMINETYPE_0002 downloadTask: " + downloadTask);
        try {
          let data = await downloadTask.getTaskMimeType();
          expect(data != undefined).assertEqual(true);
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMINETYPE_0002 throw_error: " + JSON.stringify(err));
        } finally {
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });

    /**
     * @tc.number    SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001
     * *@tc.name     subRequestDownloadApiTaskInfo0001
     * @tc.desc      Get the download task info, and test the field of TaskInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("subRequestDownloadApiTaskInfo0001", 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001 is starting---------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001.txt`;
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001.txt`);
      let downloadFileConfig = {
        url: "https://gitee.com/chenzhixue/downloadTest/releases/download/v1.0/test.apk",
        header: {
          headers: "http",
        },
        enableMetered: false,
        enableRoaming: false,
        description: "XTS download test!",
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: "XTS download test!",
        background: false,
      };
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, downloadTask) => {
        console.info("====>SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo(async (err, data) => {
            try {
              if (err) {
                console.error("====>SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001 Failed to getTaskInfo the download task.");
                expect().assertFail();
                done();
              }
              console.info("====>SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001 Download getTaskInfo success.");
              expect(typeof data == "object").assertTrue();
              expect(typeof data.description == "string").assertTrue();
              expect(typeof data.downloadedBytes == "number").assertTrue();
              expect(typeof data.downloadId == "number").assertTrue();
              expect(typeof data.failedReason == "number").assertTrue();
              expect(typeof data.fileName == "string").assertTrue();
              expect(typeof data.filePath == "string").assertTrue();
              expect(typeof data.pausedReason == "number").assertTrue();
              expect(typeof data.status == "number").assertTrue();
              expect(typeof data.targetURI == "string").assertTrue();
              expect(typeof data.downloadTitle == "string").assertTrue();
              expect(typeof data.downloadTotalBytes == "number").assertTrue();
            } catch (err) {
              console.error("====>SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001 throw_error" + JSON.stringify(err));
            }
            await downloadTask.delete();
            removeFile(downloadFilePath);
            done();
          });
        } catch (err) {
          console.error("====>SUB_REQUEST_DOWNDLOAD_API_TASKINFO_0001 getTaskInfo catch error" + JSON.stringify(err));
          await downloadTask.delete();
          removeFile(downloadFilePath);
          done();
        }
      });
    });
  });
}
