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
import testndk from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import batteryInfo from '@ohos.batteryInfo';

let TAG = '[testLog-ets]';
export default function preferencesNdkTest() {
  describe('preferencesNdkTest', async (done: Function) => {

    it('OH_PreferencesOption_Create_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_Create_0100();
      console.info(TAG + "OH_PreferencesOption_Create_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_PreferencesOption_SetFilePath_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_SetFilePath_0100();
      console.info(TAG + "OH_PreferencesOption_SetFilePath_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_PreferencesOption_SetFilePath_0200', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_SetFilePath_0200();
      console.info(TAG + "OH_PreferencesOption_SetFilePath_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_PreferencesOption_SetBundleName_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_SetBundleName_0100();
      console.info(TAG + "OH_PreferencesOption_SetBundleName_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_PreferencesOption_SetBundleName_0200', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_SetBundleName_0200();
      console.info(TAG + "OH_PreferencesOption_SetBundleName_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_PreferencesOption_SetDataGroupId_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_SetDataGroupId_0100();
      console.info(TAG + "OH_PreferencesOption_SetFilePath_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_PreferencesOption_SetDataGroupId_0200', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_SetDataGroupId_0200();
      console.info(TAG + "OH_PreferencesOption_SetFilePath_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_PreferencesOption_Destroy_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_Destroy_0100();
      console.info(TAG + "OH_PreferencesOption_Destroy_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_PreferencesOption_Destroy_0200', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesOption_Destroy_0200();
      console.info(TAG + "OH_PreferencesOption_Destroy_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_Open_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_Open_0100();
      console.info(TAG + "OH_Preferences_Open_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_Open_0200', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_Open_0200();
      console.info(TAG + "OH_Preferences_Open_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_Preferences_Close_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_Close_0100();
      console.info(TAG + "OH_Preferences_Close_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_SetInt_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_SetInt_0100();
      console.info(TAG + "OH_Preferences_SetInt_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_SetGetInt_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_SetGetInt_0100();
      console.info(TAG + "OH_Preferences_SetInt_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_SetGetString_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_SetGetString_0100();
      console.info(TAG + "OH_Preferences_SetGetString_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_SetGetBool_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_SetGetBool_0100();
      console.info(TAG + "OH_Preferences_SetGetBool_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_SetString_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_SetString_0100();
      console.info(TAG + "OH_Preferences_SetString_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_SetBool_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_SetBool_0100();
      console.info(TAG + "OH_Preferences_SetBool_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_Preferences_GetInt_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_GetInt_0100();
      console.info(TAG + "OH_Preferences_GetInt_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_Preferences_GetString_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_GetString_0100();
      console.info(TAG + "OH_Preferences_GetString_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_GetBool_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_GetBool_0100();
      console.info(TAG + "OH_Preferences_GetBool_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_Preferences_FreeString', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_FreeString();
      console.info(TAG + "OH_Preferences_FreeString res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    it('OH_Preferences_RegisterDataObserver_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_RegisterDataObserver_0100();
      console.info(TAG + "OH_Preferences_RegisterDataObserver_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    it('OH_Preferences_UnregisterDataObserver_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_UnregisterDataObserver_0100();
      console.info(TAG + "OH_Preferences_UnregisterDataObserver_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_Preferences_RegisterDataObserver_0200', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_RegisterDataObserver_0200();
      console.info(TAG + "OH_Preferences_RegisterDataObserver_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });



    it('OH_PreferencesPair_0200', 0, async (done: Function) => {
      let res:int = testndk.OH_PreferencesPair_0200();
      console.info(TAG + "OH_PreferencesPair_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    it('OH_Preferences_ErrCode_0100', 0, async (done: Function) => {
      let res:int = testndk.OH_Preferences_ErrCode_0100();
      console.info(TAG + "OH_Preferences_ErrCode_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    // it('GetInt1000', 0, async (done: Function) => {
    //   let res:int = testndk.GetInt1000();
    //   console.info(TAG + "GetInt1000 res=" + res );
    //   expect(res).assertEqual(0);
    //   done();
    // });
    // it('GetString1000', 0, async (done: Function) => {
    //   let res:int = testndk.GetString1000();
    //   console.info(TAG + "GetString1000 res=" + res );
    //   expect(res).assertEqual(0);
    //   done();
    // });
    // it('GetBool1000', 0, async (done: Function) => {
    //   let res:int = testndk.GetBool1000();
    //   console.info(TAG + "GetBool1000 res=" + res );
    //   expect(res).assertEqual(0);
    //   done();
    // });

  })
}