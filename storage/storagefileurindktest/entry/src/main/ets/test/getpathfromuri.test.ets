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

import { describe, it, expect } from '@ohos/hypium';
import getpathfromuri from 'libgetpathfromuri.so';
import fileuri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';

export default function fileuriNdkTest(){
   describe('fileuri_Ndk_test',async function(){

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0100
       * @tc.name fileuri_geturifrompath_001
       * @tc.desc function of API, Test GetUriFromPath, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('fileuri_geturifrompath_001', 0,async function (done){
         try{
            let ret = getpathfromuri.GetUriFromPath();
            console.info("fileuri_geturifrompath_001 test napi ret = " + JSON.stringify(ret));
            console.info("fileuri_geturifrompath_001 test successful!");
            expect(ret).assertEqual(0);
            done();
         }catch(e){
            console.info('fileuri_geturifrompath_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0200
       * @tc.name fileuri_getpathfromuri_001
       * @tc.desc function of API, Test GetPathFromUri, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('fileuri_getpathfromuri_001', 0,async function (done){
         try{
            let ret = getpathfromuri.GetPathFromUri();
            console.info("fileuri_getpathfromuri_001 test napi ret = " + JSON.stringify(ret));
            if(ret == 801){
               expect(true).assertTrue();
               done();
            }else{
               console.info("fileuri_getpathfromuri_001 test successful!");
               expect(ret).assertEqual(0);
               done();
            };
            done();
         }catch(e){
            console.info('fileuri_getpathfromuri_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0300
       * @tc.name fileuri_getfulldirectory_001
       * @tc.desc function of API, Test getfulldirectory, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('fileuri_getfulldirectory_001', 0,async function (done){
         try{
            let filepath = getContext().filesDir + "/1.txt";
            fs.openSync(filepath,0o102);
            let uri = new fileuri.FileUri(filepath);
            let ret = getpathfromuri.GetFullDirectoryUri();
            console.info("fileuri_getfulldirectory_001 test napi ret = "+ JSON.stringify(ret));
            if(ret == 801){
               expect(true).assertTrue();
               done();
            }else{
               console.info("fileuri_getfulldirectory_001 test successful!");
               expect(ret).assertEqual(0);
               done();
            };
            done();
         }catch(e){
            console.info('fileuri_getfulldirectory_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_getfileuri_0400
       * @tc.name fileuri_isvaliduri_001
       * @tc.desc function of API, Test IsValidUri, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('fileuri_isvaliduri_001', 0,async function (done){
         try{
            let filepath = getContext().filesDir + "/4.txt";
            fs.openSync(filepath,0o102);
            let uri = new fileuri.FileUri(filepath);
            console.info("fileuri_isvaliduri_001 test napi uri = "+ uri);
            let ret = getpathfromuri.IsValidUri();
            console.info("fileuri_isvaliduri_001 test napi ret = "+ JSON.stringify(ret));
            console.info("fileuri_isvaliduri_001 test successful!");
            expect(ret).assertEqual(1);
            done();
         }catch(e){
            console.info('fileuri_isvaliduri_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });
   });
}