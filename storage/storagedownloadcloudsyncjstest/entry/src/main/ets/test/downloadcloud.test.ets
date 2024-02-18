/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll,beforeEach,afterEach,afterAll,it,expect } from '@ohos/hypium';
import connection from '@ohos.net.connection';
import cloudSync from '@ohos.file.cloudSync';

export default function cloudFileDownloadTest(){
    let uri_ ="file://media/image/7";
    let cloudSyncDownload;
    let isConnect:Boolean;

describe('cloud_file_download_test',async function(){
  async function getNetId(){
    let netId = 0;
    try {
      let netHandle = await
      connection.getDefaultNet();
      if(netHandle){
        console.log('getNetId info :${JSON.stringify(netHandle)}');
        netId = netHandle.netId
      }
    }catch (error){
      console.error('getNetId Error : ${JSON.stringify(error)}');
    }
    return netId;
}
beforeAll(async function(){
  console.info("beforeAllcase uri:" + uri_);
    try {
        let netId = await getNetId();
        if (netId >= 100){
            isConnect = false;
        }
        console.info('网络状态：${isConnect}');
        cloudSyncDownload =new cloudSync.Download();
    }catch (err){
      console.error("beforeAll case err :" + err);
    }
});

beforeEach(async function ()
{
  console.info("beforeEachcase");
});
afterAll(function (){
  console.info("afterAll case");
});

function errHandle(err,tag){
  console.error('${tag}err.code :${err.code} err.message :${err.message} isConnect : ${isConnect}');
    if (err.code != undefined) {
      switch (err.code){
        case 13600001://IPC error
        console.error('${tag} ICP error');
        expect(true).assertTrue();
        break;
        case 22400002:// Network unavailable
        expect(true).assertTrue();
        break;
        case 401: //The inputparameter is invalid
        console.error('${tag} The input parameter is invalid');
        expect(true).assertTrue();
        break;
      }
    }else{
      console.error('${tag} catch failed.err = $ {JSON.stringify(err)}');
      expect(false).assertTrue();
    }
  };

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0100
   * @tc.name download_state_test_001
   * @tc.desc function of API, Test State RUNNING
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('download_state_test_001', 3,function (done){
     let TAG = "download_state_test_001::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state);
           if (pg.state.RUNNING == 0) {
             console.info("state:pg.state.RUNNING==0-云文件正在下载中");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_STATE_TEST_0200
   * @tc.name download_state_test_002
   * @tc.desc function of API, Test State FAILED
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('download_state_test_002', 3,function (done){
     let TAG = "download_state_test_002::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state);
           if (pg.state.FAILED == 2) {
             console.info("state:pg.state.RUNNING==2-云文件下载失败");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_PROCESSED_TEST_0100
   * @tc.name download_processed_test_001
   * @tc.desc function of API, Test State processed
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('download_processed_test_001', 3,function (done){
     let TAG = "download_processed_test_001::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("on:callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.state = " + pg.state);
           if (pg.state.FAILED == 2) {
             console.info("on:callback succeed. pg.processed = " + pg.processed);
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0100
   * @tc.name download_error_test_001
   * @tc.desc function of API, Test DownloadErrorType NO_ERROR
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('download_error_test_001', 3,function (done){
     let TAG = "error_test_001::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
         if (pg.state.NO_ERROR == 0) {
           console.info("error: pg.error.NO_ERROR==0-没有错误");
           expect(true).assertTrue();
         }
       }
       });
    expect(true).assertTrue();
    } catch (err) {
      errHandle(err,TAG);
    }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0200
   * @tc.name download_error_test_002
   * @tc.desc function of API, Test DownloadErrorType UNKNOWN_ERROR
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('download_error_test_002', 3,function (done){
     let TAG = "error_test_002::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.state.UNKNOWN_ERROR == 1) {
             console.info("error: pg.error.UNKNOWN_ERROR==1-未知错误");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0300
   * @tc.name download_error_test_003
   * @tc.desc function of API, Test DownloadErrorType NETWORK_UNAVAILABLE
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('download_error_test_003', 3,function (done){
     let TAG = "error_test_003::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.state.NETWORK_UNAVAILABLE == 2) {
             console.info("error: pg.error.NETWORK_UNAVAILABLE==2-网络不可用");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
   * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0400
   * @tc.name download_error_test_004
   * @tc.desc function of API, Test DownloadErrorType LOCAL_STORAGE_FULL
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('download_error_test_004', 3,function (done){
     let TAG = "error_test_004::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           if (pg.error.LOCAL_STORAGE_FULL == 3) {
             console.info("error: pg.error.LOCAL_STORAGE_FULL==3-本地空间不足");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });
 
   /**
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0500
    * @tc.name download_error_test_005
    * @tc.desc function of API, Test DownloadErrorType CONTENT_NOT_FOUND
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 3
    * @tc.require
    */
   it('download_error_test_005', 3,function (done){
     let TAG = "error_test_005::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error.CONTENT_NOT_FOUND);
           if (pg.error.CONTENT_NOT_FOUND == 4) {
             console.info("error: pg.error.CONTENT_NOT_FOUND==4-云端空间未找到对应文件");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });

   /**
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0600
    * @tc.name download_error_test_006
    * @tc.desc function of API, Test DownloadErrorType FREQUENT_USER_REQUESTS
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 3
    * @tc.require
    */
   it('download_error_test_006', 3,function (done){
     let TAG = "error_test_006::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("download_on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error.FREQUENT_USER_REQUESTS);
           if (pg.error.FREQUENT_USER_REQUESTS == 5) {
             console.info("error: pg.error.CONTENT_NOT_FOUND==5-用户请求过于频繁");
             expect(true).assertTrue();
           }
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });
 
   /**
    * @tc.number SUB_STORAGE_DOWNLOAD_ERROR_TEST_0700
    * @tc.name download_error_test_007
    * @tc.desc function of API, Test Test_error on() interfaces.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 3
    * @tc.require
    */
   it('download_error_test_007', 3,function (done){
     let TAG = "error_test_007::";
     try {
       cloudSyncDownload.on("progress",(pg)=>{
         console.info("on: callback succeed.");
         if(pg != undefined){
           console.info("on:callback succeed. pg.error = " + pg.error);
           expect(true).assertTrue();
         }
       });
       expect(true).assertTrue();
     } catch (err) {
       errHandle(err,TAG);
     }
     done();
   });
  });
}