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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function requestDownloadJSUnit() {
  describe('requestDownloadJSUnit', function () {
    console.info('====>################################request download Test start');

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

    let downloadTask;

    /**
     * @tc.number    SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, data)=>{
        downloadTask = data;
        console.info("====>SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 downloadTask: " + downloadTask);
        try{
          expect(true).assertEqual(downloadTask != undefined);
          await downloadTask.delete()
        }catch(e){
          console.info("====>SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 except error: " + e);
        }
        console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_CALLBACK_0001 end-----------------------");
        done();
      });      
    });

    /**
     * @tc.number    SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001
     * @tc.desc      Starts a download session.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001', 0, async function (done) {
      console.info("-----------------------SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        request.downloadFile(globalThis.abilityContext, downloadFileConfig).then(async (data) => {
          downloadTask = data;
          console.info("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 downloadTask: " + downloadTask);
          expect(true).assertEqual(downloadTask != undefined);
          await downloadTask.delete()
          done();
        }).catch(err => {
          console.error("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 error: " + err);
          done();
        })
      }catch(err){
        console.error("====>SUB_REQUEST_downloadFile_STAGE_API_PROMISE_0001 catch error: " + err);
        done();
      }
      
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_DELETE_0001
     * @tc.desc Delete the download task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DELETE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_delete_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 downloadTask: " + downloadTask);        
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.delete((err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 Failed to delete the download task.');
                expect().assertFail();
              }
              console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 Download task delete success.');
              expect(typeof data == "boolean").assertTrue();
            }catch(err){
              console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 delete throw error' + err);
            }
            done();
          });
        } catch (error) {
          console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0001 delete catch error' + error);
          done();
        }
      })
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_DELETE_0002
     * @tc.desc Delete the download task.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_DELETE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_DELETE_0002.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }      
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 downloadTask: " + downloadTask);
        try {
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.delete().then(data => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Download task delete success.');
            expect(data).assertEqual(true);
            console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_DELETE_0002 end-----------------------");
            done();
          }).catch((err) => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 Failed to delete the download task.');
            expect().assertFail();
            done();
          })
        } catch (error) {
          console.error('====>SUB_REQUEST_DOWNLOAD_API_DELETE_0002 delete catch error');
          done();
        }        
      })   
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001
     * @tc.desc Suspend the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.suspend((err, data) => {
            try{
              if (err) {
              console.error('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 Failed to suspend the download task.');
              expect().assertFail();
              }
              console.info('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 Download task suspend success.');
              expect(data == true).assertTrue();
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 throw_error: " + JSON.stringify(err));
            }
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0001 suspend catch error' + JSON.stringify(err));
          done();
        }
      })
      
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002
     * @tc.desc Suspend the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.suspend().then(data => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 Download task suspend success.');
            expect(data == true).assertTrue();
            done();
          }).catch((err) => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 throw_err:' + JSON.stringify(err));
            done();
          })
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_SUSPEND_0002 suspend catch error' + JSON.stringify(err));
          done();
        }      
      })      
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_RESTORE_0001
     * @tc.desc Restore the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_RESTORE_0001', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.restore((err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 Failed to restore the download task.');
                expect().assertFail();
              }
              console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 Download  restore success.');
              expect(data == true).assertTrue();
            }catch(err){
              console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 throw_err:' + JSON.stringify(err));
            }
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0001 restore catch error' + JSON.stringify(err));
          done();
        }     
      });
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_RESTORE_0002
     * @tc.desc Restore the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_RESTORE_0002', 0, async function (done) {
      console.info("====>-----------------------SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 is starting-----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_RESTORE_0002.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }   
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.restore().then(data => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 Download task restore.');
            expect(data == true).assertTrue();
            done();
          }).catch((err) => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 Failed to restore the download task.');
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_RESTORE_0002 restore catch error' +JSON.stringify(err));
          done();
        }    
      });
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001
     * @tc.desc Get the download task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001', 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 is starting---------------------"); 
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo((err, data) => {
            try{
              if (err) {
                console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 Failed to getTaskInfo the download task.');
                expect().assertFail();
              }
              console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 Download getTaskInfo success.');
              expect(typeof data == "object").assertTrue();
            }catch(err){
              console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 throw_error' +JSON.stringify(err));
            }  
            done();          
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0001 getTaskInfo catch error' + JSON.stringify(err));
          done();
        }
      });      
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002
     * @tc.desc Get the download task info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002', 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 is starting----------------------");
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 downloadTask: " + downloadTask);        
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.getTaskInfo().then(data => {
            console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Download task getTaskInfo success.');
            expect(typeof data == "object").assertTrue();
            done();
          }).catch((err) => {
            console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 Failed to getTaskInfo the download task.');            
            done();
          });
        }catch(err){
          console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKINFO_0002 getTaskInfo catch error' + JSON.stringify(err));
          done();
        }
      });      
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001', 0, async function (done) {
      console.info("====>---------------------SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 is starting---------------------"); 
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress',(data1, data2) => {
            try{
              if (data1 > 0){
                downloadTask.getTaskMimeType(async (err, data)=>{
                  try{
                    if(err) {
                      console.error('====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 err:'+ JSON.stringify(err));
                      expect().assertFail();
                      done();
                    }
                    if (data) {
                      console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 data:' + JSON.stringify(data));
                      expect(typeof data == "string").assertTrue();
                    } else {
                      console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 error: " + JSON.stringify(err));
                      expect().assertFail(); 
                    }
                  }catch(err){
                    console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 throw_error: " + JSON.stringify(err));
                  }
                  setTimeout(()=>{
                    done();
                  },1000)             
                });
              }
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 error: " + JSON.stringify(err));
              done();
            }            
          })          
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0001 error: " + JSON.stringify(err));
          done();
        }       
      })     
    });

    /**
     * @tc.number SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002
     * @tc.desc Get mimetype of the download task
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002', 0, async function (done) {
      console.info("====>-------------------SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 is starting----------------------"); 
      let downloadFilePath = `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002.txt`
      console.debug("====>downloadFileConfig:" + `${globalThis.abilityContext.tempDir}/SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002.txt`)
      let downloadFileConfig = {
        url: 'https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',
        header: {
          headers: 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(globalThis.abilityContext, downloadFileConfig, async (err, data) => {
        downloadTask = data;
        console.info("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 downloadTask: " + downloadTask);
        try{
          expect(downloadTask != undefined).assertEqual(true);
          downloadTask.on('progress', async (data1, data2) => {
            try{
              if(data1 > 0){
                let data = await downloadTask.getTaskMimeType()
                console.info('====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 data:' + JSON.stringify(data));
                expect(typeof data == "string").assertTrue();                  
              }
              setTimeout(()=>{
                done();
              },1000) 
            }catch(err){
              console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 throw_error: " + JSON.stringify(err));
              done();
            }            
          })          
        }catch(err){
          console.error("====>SUB_REQUEST_DOWNLOAD_API_GETTASKMIMETYPE_0002 error: " + JSON.stringify(err));
          done();
        }  
      })     
    });
  });
}