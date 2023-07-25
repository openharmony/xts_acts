/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import dataPreferences from '@ohos.data.preferences';

const TAG = "[ttt]"

export default function preferencesDataGroupIdPromise() {
  describe('preferencesDataGroupIdPromise', function () {

    console.log(TAG + "*************Unit Test Begin*************");


    /**
     * @tc.number SUB_DDM_Preferences_DataGroupId_Promise_0100
     * @tc.name preferences dataGroupId null promise test
     * @tc.desc preferences getPreferences dataGroupId null promise test
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0100', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      try{
        dataPreferences.getPreferences(globalThis.abilityContext, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.deletePreferences(globalThis.abilityContext, Options).then(async (val) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `deletePreferences failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_Preferences_DataGroupId_Promise_0200
     * @tc.name preferences dataGroupId undefined promise test
     * @tc.desc preferences getPreferences dataGroupId undefined promise test
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0200', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined,
      };
      try{
        dataPreferences.getPreferences(globalThis.abilityContext, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.deletePreferences(globalThis.abilityContext, Options).then(async (val) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `deletePreferences failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_Preferences_DataGroupId_Promise_0300
     * @tc.name preferences dataGroupId promise test
     * @tc.desc preferences getPreferences dataGroupId promise test
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0300', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: '112233',
      };
      try{
        dataPreferences.getPreferences(globalThis.abilityContext, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.deletePreferences(globalThis.abilityContext, Options).then(async (val) => {
            console.info(TAG, `deletePreferences successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `deletePreferences failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_Preferences_DataGroupId_Promise_0400
     * @tc.name preferences dataGroupId null promise test
     * @tc.desc preferences getPreferences dataGroupId null promise test
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0400', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: null,
      };
      try{
        dataPreferences.getPreferences(globalThis.abilityContext, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.removePreferencesFromCache(globalThis.abilityContext, Options).then(async (val) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `removePreferencesFromCache failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_Preferences_DataGroupId_Promise_0500
     * @tc.name preferences dataGroupId undefined promise test
     * @tc.desc preferences removePreferencesFromCache dataGroupId undefined promise test
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0500', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: undefined,
      };
      try{
        dataPreferences.getPreferences(globalThis.abilityContext, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.removePreferencesFromCache(globalThis.abilityContext, Options).then(async (val) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `removePreferencesFromCache failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number SUB_DDM_Preferences_DataGroupId_Promise_0600
     * @tc.name preferences dataGroupId promise test
     * @tc.desc preferences removePreferencesFromCache dataGroupId promise test
     */
    it('SUB_DDM_Preferences_DataGroupId_Promise_0600', 0, async function (done) {
      const Options = {
        name: "test_preferences_callback",
        dataGroupId: '112233',
      };
      try{
        dataPreferences.getPreferences(globalThis.abilityContext, Options).then(async (data) => {
          console.info(TAG, `getPreferences successfully.`);
          expect().assertFail();
          done();
          dataPreferences.removePreferencesFromCache(globalThis.abilityContext, Options).then(async (val) => {
            console.info(TAG, `removePreferencesFromCache successfully.`);
            expect().assertFail();
            done();
          }).catch((error) => {
            console.error(TAG, `removePreferencesFromCache failed, code is ${error.code},message is ${error.message}`);
            expect(error !== null).assertFail();
            done();
          })
        }).catch((err) => {
          console.error(TAG, `getPreferences failed, code is ${err.code},message is ${err.message}`);
          expect(err !== null).assertFail();
          done();
        })
      }catch(errInfo){
        console.error(TAG, `failed, code is ${errInfo.code},message is ${errInfo.message}`);
        expect(errInfo.code).assertEqual('15501002');
        done();
      }
    })

    console.log(TAG + "*************Unit Test End*************");
  })
}