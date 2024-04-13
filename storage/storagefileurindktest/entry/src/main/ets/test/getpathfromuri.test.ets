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
   describe('getfileuri_Ndk_test',async function(){

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_NDK_Fileuri_0100
       * @tc.name geturifrompath_ndktest_001
       * @tc.desc function of API, Test GetUriFromPath, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('geturiFrompath_ndktest_001', 0,async function (done){
         try{
            let ret = getpathfromuri.GetUriFromPath();
            console.info("geturiFrompath_ndktest_001 test napi ret = " + JSON.stringify(ret));
            console.info("geturiFrompath_ndktest_001 test successful!");
            expect(ret).assertEqual(0);
            done();
         }catch(e){
            console.info('geturifrompath_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_NDK_Fileuri_0200
       * @tc.name getpathfromuri_ndktest_001
       * @tc.desc function of API, Test GetPathFromUri, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('getpathfromuri_ndktest_001', 0,async function (done){
         try{
            let ret = getpathfromuri.GetPathFromUri();
            console.info("getpathfromuri_ndktest_001 test napi ret = " + JSON.stringify(ret));
            if(ret == 801){
               expect(true).assertTrue();
               done();
            }else{
               console.info("getpathfromuri_ndktest_001 test successful!");
               expect(ret).assertEqual(0);
               done();
            };
            done();
         }catch(e){
            console.info('getpathfromuri_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_NDK_Fileuri_0300
       * @tc.name getfulldirectory_ndktest_001
       * @tc.desc function of API, Test getfulldirectory, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('getfulldirectory_ndktest_001', 0,async function (done){
         try{
            let filepath = getContext().filesDir + "/test3.txt";
            fs.openSync(filepath,0o102);
            let uri = new fileuri.FileUri(filepath);
            let ret = getpathfromuri.GetFullDirectoryUri();
            if(ret == 801){
               expect(true).assertTrue();
               done();
            }else{
               console.info("getfulldirectory_ndktest_001 test successful!");
               expect(ret).assertEqual(0);
               done();
            };
            done();
         }catch(e){
            console.info('getfulldirectory_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });

      /**
       * @tc.number SUB_BASIC_FM_FileAPI_NDK_Fileuri_0400
       * @tc.name IsValidUri_ndktest_001
       * @tc.desc function of API, Test IsValidUri, normal function
       * @tc.size MEDIUM
       * @tc.type Function
       * @tc.level Level 0
       * @tc.require
       */
      it('IsValidUri_ndktest_001', 0,async function (done){
         try{
            let filepath = getContext().filesDir + "/test4.txt";
            fs.openSync(filepath,0o102);
            let uri = new fileuri.FileUri(filepath);
            console.info("IsValidUri_ndktest_001 test napi uri = "+ uri);
            let ret = getpathfromuri.IsValidUri();
            console.info("IsValidUri_ndktest_001 test napi ret = "+ JSON.stringify(ret));
            console.info("IsValidUri_ndktest_001 test successful!");
            expect(ret).assertEqual(1);
            done();
         }catch(e){
            console.info('IsValidUri_ndktest_001 has failed for ' + e.message + ', code: ' + e.code);
            expect(false).assertTrue();
         }
      });
   });
}