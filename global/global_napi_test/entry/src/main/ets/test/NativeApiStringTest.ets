// @ts-nocheck
/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'hypium/index'
import resManager from '@ohos.resourceManager'
import ndk from 'libresmgrndk.so'

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0100', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0100 22");
        let value = ndk.GetFileList(mgr, "test");
        console.log("getResourceManager_ndktest_0100 3");
        console.log("getResourceManager_ndktest_0100" + value);
        console.log("getResourceManager_ndktest_0100" + value.length);
        expect(value.length > 0).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0200
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0200', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0200 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0200 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0200 22");
        let value = ndk.GetRawFileContent(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0200 3");
        console.log("getResourceManager_ndktest_0200" + value);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0300
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0300', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0300 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0300 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0300 22");
        let value = ndk.GetRawFileDescriptor(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0300 3");
        console.log("getResourceManager_ndktest_0300" + value.fd);
        console.log("getResourceManager_ndktest_0300" + value.offset);
        console.log("getResourceManager_ndktest_0300" + value.length);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0400
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0400', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0400 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0400 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0400 22");
        let value = ndk.GetRawFileDescriptor64(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0400 3");
        console.log("getResourceManager_ndktest_0400" + value);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_RESMGR_NDK_0500
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getResourceManager_ndktest_0500', 0, async (done: Function) => {
      console.log("getResourceManager_ndktest_0500 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getResourceManager_ndktest_0500 2");
        expect(mgr !== null).assertTrue();
        console.log("getResourceManager_ndktest_0500 22");
        let value = ndk.GetRawFileDescriptor64(mgr, "test/aa.xml");
        console.log("getResourceManager_ndktest_0500 3");
        console.log("getResourceManager_ndktest_0500" + value.fd);
        console.log("getResourceManager_ndktest_0500" + value.offset);
        console.log("getResourceManager_ndktest_0500" + value.length);
        expect(value !== null).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_isRawDir_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('isRawDir_ndktest_0100',0, function () {
      let value=ndk.isRawDir(resManager.getResourceManager(),'')
      expect(value).assertTrue()
    })

    /* *
    * @tc.number  SUB_GLOBAL_getDrawableDescriptor_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getDrawableDescriptor_ndktest_0100',0, function () {
      let value=ndk.getDrawableDescriptor(resManager.getResourceManager(),$r('app.media.icon').id)
      expect(value).assertTrue()
    })

    /* *
    * @tc.number  SUB_GLOBAL_getDrawableDescriptorByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getDrawableDescriptorByName_ndktest_0100',0, function () {
      let value=ndk.getDrawableDescriptorByName(resManager.getResourceManager())
      expect(value).assertTrue()
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMediaBase64_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMediaBase64_ndktest_0100',0, function () {
      let value=ndk.getMediaBase64(resManager.getResourceManager(),$r('app.media.icon').id)
      expect(value).assertTrue()
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMediaBase64ByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMediaBase64ByName_ndktest_0100',0, function () {
      let value=ndk.getMediaBase64ByName(resManager.getResourceManager())
      expect(value).assertTrue()
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMedia_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMedia_ndktest_0100',0, function () {
      let value=ndk.getMedia(resManager.getResourceManager(),$r('app.media.icon').id)
      expect(value).assertTrue()
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMediaByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMediaByName_ndktest_0100',0, function () {
      let value=ndk.getMediaByName(resManager.getResourceManager())
      expect(value).assertTrue()
    })

  })
}