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
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsDlpNDKTest() {
  describe('ActsDlpNDKTest', () => {
    
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number dlp_Permission_ndk_0100
     * @tc.name test OH_DLP_GetDlpPermissionInfo Test Normal Scene.
     * @tc.desc Obtains the permission info of this DLP file.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('dlp_Permission_ndk_0100', 0, async (done: Function) => {
      console.log("=======> dlp_Permission_ndk_0100  ==========");
      
      try{
        let result = await testNapi.osGetDlpPermissionInfoA();
        console.log("=======>dlp_Permission_ndk_0100 result：" + result);
        expect(result).assertEqual(19100006);
        done();
      } catch (error) {
        console.error("=======>dlp_Permission_ndk_0100 catch error：" + error);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number dlp_Permission_ndk_0200
     * @tc.name test OH_DLP_GetOriginalFileName Test Normal Scene.
     * @tc.desc Obtains the original file name from a DLP file name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('dlp_Permission_ndk_0200', 0, async (done: Function) => {
      console.log("=======> dlp_Permission_ndk_0200  ==========");
      
      try{
        let result = await testNapi.osGetOriginalFileNameA();
        console.log("=======>dlp_Permission_ndk_0200 result：" + result);
        expect(result).assertEqual('test.txt');
        done();
      } catch (error) {
        console.error("=======>dlp_Permission_ndk_0200 catch error：" + error);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.number dlp_Permission_ndk_0300
     * @tc.name test OH_DLP_IsInSandbox Test Normal Scene.
     * @tc.desc Checks whether current application is in the DLP sandbox.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('dlp_Permission_ndk_0300', 0, async (done: Function) => {
      console.log("=======> dlp_Permission_ndk_0300  ==========");
      
      try{
        let result = await testNapi.osIsInSandboxA();
        console.log("=======>dlp_Permission_ndk_0300 result：" + result);
        expect(result).assertFalse();
        done();
      } catch (error) {
        console.error("=======>dlp_Permission_ndk_0300 catch error：" + error);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.number dlp_Permission_ndk_0400
     * @tc.name test OH_DLP_SetSandboxAppConfig Test Normal Scene.
     * @tc.desc Sets sandbox application configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('dlp_Permission_ndk_0400', 0, async (done: Function) => {
      console.log("=======> dlp_Permission_ndk_0400  ==========");
      
      try{
        let result = await testNapi.osSetSandboxAppConfigA();
        console.log("=======>dlp_Permission_ndk_0400 result：" + result);
        expect(result).assertEqual(0);
        done();
      } catch (error) {
        console.error("=======>dlp_Permission_ndk_0400 catch error：" + error);
        expect(false).assertTrue();
        done();
      }
    })
    
    /**
     * @tc.number dlp_Permission_ndk_0500
     * @tc.name test OH_DLP_GetSandboxAppConfig Test Normal Scene.
     * @tc.desc Obtains sandbox application configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('dlp_Permission_ndk_0500', 0, async (done: Function) => {
      console.log("=======> dlp_Permission_ndk_0500  ==========");
      
      try{
        let result = await testNapi.osGetSandboxAppConfigA();
        console.log("=======>dlp_Permission_ndk_0500 result：" + result);
        expect(result).assertEqual('configInfo');
        done();
      } catch (error) {
        console.error("=======>dlp_Permission_ndk_0500 catch error：" + error);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number dlp_Permission_ndk_0600
     * @tc.name test OH_DLP_CleanSandboxAppConfig Test Normal Scene.
     * @tc.desc Cleans sandbox application configuration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('dlp_Permission_ndk_0600', 0, async (done: Function) => {
      console.log("=======> dlp_Permission_ndk_0600  ==========");
      
      try{
        let result = await testNapi.osCleanSandboxAppConfigA();
        console.log("=======>dlp_Permission_ndk_0600 result：" + result);
        expect(result).assertEqual(0);
        done();
      } catch (error) {
        console.error("=======>dlp_Permission_ndk_0600 catch error：" + error);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
