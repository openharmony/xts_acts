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
    it('isRawDir_ndktest_0100', 0, async (done: Function) => {
      console.log("isRawDir_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("isRawDir_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("isRawDir_ndktest_0100 22");
        let value = ndk.IsRawDir(resManager.getResourceManager(), '');
        console.log("isRawDir_ndktest_0100 3");
        console.log("isRawDir_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getDrawableDescriptor_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getDrawableDescriptor_ndktest_0100', 0, async (done: Function) => {
      console.log("getDrawableDescriptor_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getDrawableDescriptor_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getDrawableDescriptor_ndktest_0100 22");
        let value = ndk.GetDrawableDescriptor(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getDrawableDescriptor_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getDrawableDescriptorByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getDrawableDescriptorByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getDrawableDescriptorByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getDrawableDescriptorByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getDrawableDescriptorByName_ndktest_0100 22");
        let value = ndk.GetDrawableDescriptorByName(resManager.getResourceManager());
        console.log("getDrawableDescriptorByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMediaBase64_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMediaBase64_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaBase64_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaBase64_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaBase64_ndktest_0100 22");
        let value = ndk.GetMediaBase64(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getMediaBase64_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMediaBase64ByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMediaBase64ByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaBase64ByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaBase64ByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaBase64ByName_ndktest_0100 22");
        let value = ndk.GetMediaBase64ByName(resManager.getResourceManager());
        console.log("getMediaBase64ByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMedia_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMedia_ndktest_0100', 0, async (done: Function) => {
      console.log("getMedia_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMedia_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMedia_ndktest_0100 22");
        let value = ndk.GetMedia(resManager.getResourceManager(), $r('app.media.icon').id);
        console.log("getMedia_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getMediaByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getMediaByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getMediaByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getMediaByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getMediaByName_ndktest_0100 22");
        let value = ndk.GetMediaByName(resManager.getResourceManager());
        console.log("getMediaByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getSymbolByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getSymbolByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getSymbolByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getSymbolByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getSymbolByName_ndktest_0100 22");
        let value = ndk.GetSymbolByName(resManager.getResourceManager());
        console.log("getSymbolByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getSymbol_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getSymbol_ndktest_0100', 0, async (done: Function) => {
      console.log("getSymbol_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getSymbol_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getSymbol_ndktest_0100 22");
        let value = ndk.GetSymbol(resManager.getResourceManager(), $r('app.symbol.symbol_test').id);
        console.log("getSymbol_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getBoolByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getBoolByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getBoolByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getBoolByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getBoolByName_ndktest_0100 22");
        let value = ndk.GetBoolByName(resManager.getResourceManager());
        console.log("getBoolByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getBool_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getBool_ndktest_0100', 0, async (done: Function) => {
      console.log("getBool_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getBool_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getBool_ndktest_0100 22");
        let value = ndk.GetBool(resManager.getResourceManager(), $r('app.boolean.boolean_1').id);
        console.log("getBool_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getPluralStringByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getPluralStringByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getPluralStringByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getPluralStringByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getPluralStringByName_ndktest_0100 22");
        let value = ndk.GetPluralStringByName(resManager.getResourceManager());
        console.log("getPluralStringByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getPluralString_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getPluralString_ndktest_0100', 0, async (done: Function) => {
      console.log("getPluralString_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getPluralString_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getPluralString_ndktest_0100 22");
        let value = ndk.GetPluralString(resManager.getResourceManager(), $r('app.plural.eat_apple').id, 1);
        console.log("getPluralString_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getColorByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getColorByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getColorByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getColorByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getColorByName_ndktest_0100 22");
        let value = ndk.GetColorByName(resManager.getResourceManager());
        console.log("getColorByName_ndktest_0100" + value);
        expect(value).assertEqual(4294967210);
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getColor_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getColor_ndktest_0100', 0, async (done: Function) => {
      console.log("getColor_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getColor_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getColor_ndktest_0100 22");
        let value = ndk.GetColor(resManager.getResourceManager(), $r('app.color.start_window_background_jjq').id);
        console.log("getColor_ndktest_0100" + value);
        expect(value).assertEqual(4294967210);
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getIntByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getIntByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getIntByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getIntByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getIntByName_ndktest_0100 22");
        let value = ndk.GetIntByName(resManager.getResourceManager());
        console.log("getIntByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getInt_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getInt_ndktest_0100', 0, async (done: Function) => {
      console.log("getInt_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getInt_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getInt_ndktest_0100 22");
        let value = ndk.GetInt(resManager.getResourceManager(), $r('app.integer.integer_1').id);
        console.log("getInt_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getFloatByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getFloatByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getFloatByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getFloatByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getFloatByName_ndktest_0100 22");
        let value = ndk.GetFloatByName(resManager.getResourceManager());
        console.log("getFloatByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getFloat_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getFloat_ndktest_0100', 0, async (done: Function) => {
      console.log("getFloat_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getFloat_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getFloat_ndktest_0100 22");
        let value = ndk.GetFloat(resManager.getResourceManager(), $r('app.float.float_1').id);
        console.log("getFloat_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getLocales_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getLocales_ndktest_0100', 0, async (done: Function) => {
      console.log("getLocales_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getLocales_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getLocales_ndktest_0100 22");
        let value = ndk.GetLocales(resManager.getResourceManager());
        console.log("getLocales_ndktest_0100" + value);
        expect('' + value).assertEqual('en-US,zh-CN');
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getConfiguration_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getConfiguration_ndktest_0100', 0, async (done: Function) => {
      console.log("getConfiguration_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getConfiguration_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getConfiguration_ndktest_0100 22");
        let value = ndk.GetConfiguration(resManager.getResourceManager());
        console.log("getConfiguration_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getStringArray_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getStringArray_ndktest_0100', 0, async (done: Function) => {
      console.log("getStringArray_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getStringArray_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getStringArray_ndktest_0100 22");
        let value = ndk.GetStringArray(resManager.getResourceManager(), $r('app.strarray.size').id);
        console.log("getStringArray_ndktest_0100" + value);
        expect('' + value).assertEqual('small,big');
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getStringArrayByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getStringArrayByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getStringArrayByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getStringArrayByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getStringArrayByName_ndktest_0100 22");
        let value = ndk.GetStringArrayByName(resManager.getResourceManager());
        console.log("getStringArrayByName_ndktest_0100" + value);
        expect('' + value).assertEqual('small,big');
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_releaseStringArray_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('releaseStringArray_ndktest_0100', 0, async (done: Function) => {
      console.log("releaseStringArray_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("releaseStringArray_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("releaseStringArray_ndktest_0100 22");
        let value = ndk.ReleaseStringArray(resManager.getResourceManager());
        console.log("releaseStringArray_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_releaseConfiguration_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('releaseConfiguration_ndktest_0100', 0, async (done: Function) => {
      console.log("releaseConfiguration_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("releaseConfiguration_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("releaseConfiguration_ndktest_0100 22");
        let value = ndk.ReleaseConfiguration(resManager.getResourceManager());
        console.log("releaseConfiguration_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getStringByName_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getStringByName_ndktest_0100', 0, async (done: Function) => {
      console.log("getStringByName_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getStringByName_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getStringByName_ndktest_0100 22");
        let value = ndk.GetStringByName(resManager.getResourceManager());
        console.log("getStringByName_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })

    /* *
    * @tc.number  SUB_GLOBAL_getString_NDK_0100
    * @tc.name    test ResourceManager NDK interface
    * @tc.desc    test ResourceManager NDK interface
    */
    it('getString_ndktest_0100', 0, async (done: Function) => {
      console.log("getString_ndktest_0100 1");
      resManager.getResourceManager().then(mgr => {
        console.log("getString_ndktest_0100 2");
        expect(mgr !== null).assertTrue();
        console.log("getString_ndktest_0100 22");
        let value = ndk.GetString(resManager.getResourceManager(), $r('app.string.entry_MainAbility').id);
        console.log("getString_ndktest_0100" + value);
        expect(value).assertTrue();
      })
      done();
    })
  })
}