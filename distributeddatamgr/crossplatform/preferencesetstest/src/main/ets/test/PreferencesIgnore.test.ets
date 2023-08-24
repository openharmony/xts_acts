/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import dataPreferences from "@ohos.data.preferences";

const NAME = "test_preferences";
const NAME1 = "getPreferencesTest";
let mPreferences;
let context;

const TAG = "[PREFERENCES_IGNORE_TEST]";
export default function preferencesIgnoreTest() {
  describe("preferencesIgnoreTest", function () {
    beforeAll(async function () {
      console.info("beforeAll");
      context = globalThis.abilityContext;
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    });

    afterAll(async function () {
      console.info("afterAll");
      await dataPreferences.deletePreferences(context, NAME);
    });

    /**
     * @tc.number : SUB_DDM_TEST_PREFERENCES_GET_PREFERENCES_0100
     * @tc.name   : testPreferencesGetPreferences001
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences001", 0, async function (done) {
      try {
        // @ts-ignore
        await dataPreferences.getPreferences(context, -1, (err, preferences) => {
          if (err) {
            console.info(TAG + "Get preferences err: " + err);
            expect(!err).assertTrue();
            done();
          } else {
            console.info(TAG + "Get preferences success" + preferences);
            done();
          }
        });
      } catch (err) {
        console.info("testPreferencesGetPreferences001 fail: " + err.message + "code: " + err.code);
        expect(err.code === "401").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DDM_TEST_PREFERENCES_DELETE_PREFERENCES_0200
     * @tc.name   : testPreferencesDeletePreferences002
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences002", 0, async function (done) {
      dataPreferences.getPreferences(context, NAME1, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            // @ts-ignore
            dataPreferences.deletePreferences(context, -1, (err) => {
              if (err) {
                console.info(TAG + "Delete preferences err: " + err);
                expect(!err).assertTrue();
                done();
              }
            });
          } catch (err) {
            console.info("testPreferencesDeletePreferences002 fail: " + err.message + "code: " + err.code);
            expect(err.code === "401").assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DDM_TEST_REMOVE_PREFERENCES_FROM_CACHE_0200
     * @tc.name   : testRemovePreferencesFromCache002
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache002", 0, async function (done) {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            // @ts-ignore
            dataPreferences.removePreferencesFromCache(context, -1, (err) => {
              if (err) {
                console.info(TAG + "Remove preferences from cache error: " + err);
                expect(!err).assertTrue();
                done();
              }
            });
          } catch (err) {
            console.info("testRemovePreferencesFromCache002 fail: " + err.message + "code: " + err.code);
            expect(err.code === "401").assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DDM_TEST_GET_PREFERENCES_HELPER_0300
     * @tc.name   : testGetPreferencesHelper0003
     * @tc.desc   : GetPreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetPreferencesHelper0003", 0, async function (done) {
      try {
        // @ts-ignore
        await dataPreferences.getPreferences(context, -1);
      } catch (err) {
        console.info("testGetPreferencesHelper0003 fail: " + err.message + "code: " + err.code);
        expect(err.code === "401").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DDM_TEST_GET_PREFERENCES_HELPER_0400
     * @tc.name   : testGetPreferencesHelper0004
     * @tc.desc   : GetPreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetPreferencesHelper0004", 0, async function (done) {
      try {
        // @ts-ignore
        await dataPreferences.getPreferences(context);
      } catch (err) {
        console.info("testGetPreferencesHelper0004 fail: " + err.message + "code: " + err.code);
        expect(err.code === "401").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DDM_TEST_REMOVE_PREFERENCES_FROM_CACHE_HELPER_0200
     * @tc.name   : testRemovePreferencesFromCacheHelper0002
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0002", 0, async function (done) {
      try {
        await dataPreferences.getPreferences(context, NAME);
        // @ts-ignore
        await dataPreferences.removePreferencesFromCache(context);
      } catch (err) {
        console.info("testRemovePreferencesFromCacheHelper0002 fail: " + err.message + "code: " + err.code);
        expect(err.code === "401").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DDM_TEST_REMOVE_PREFERENCES_FROM_CACHE_HELPER_0300
     * @tc.name   : testRemovePreferencesFromCacheHelper0003
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0003", 0, async function (done) {
      try {
        await dataPreferences.getPreferences(context, NAME);
        // @ts-ignore
        await dataPreferences.removePreferencesFromCache(context, -1);
      } catch (err) {
        console.info("testRemovePreferencesFromCacheHelper0003 fail: " + err.message + "code: " + err.code);
        expect(err.code === "401").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DDM_TEST_PREFERENCES_DELETE_HELPER_0200
     * @tc.name   : testPreferencesDeleteHelper0002
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0002", 0, async function (done) {
      try {
        await dataPreferences.getPreferences(context, NAME);
        // @ts-ignore
        await dataPreferences.deletePreferences(context);
      } catch (err) {
        console.info("testPreferencesDeleteHelper0002 fail: " + err.message + "code: " + err.code);
        expect(err.code === "401").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DDM_TEST_PREFERENCES_DELETE_HELPER_0300
     * @tc.name   : testPreferencesDeleteHelper0003
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0003", 0, async function (done) {
      try {
        await dataPreferences.getPreferences(context, NAME);
        // @ts-ignore
        await dataPreferences.deletePreferences(context, -1);
      } catch (err) {
        console.info("testPreferencesDeleteHelper0003 fail: " + err.message + "code: " + err.code);
        expect(err.code === "401").assertTrue();
        done();
      }
    });
  });
}
