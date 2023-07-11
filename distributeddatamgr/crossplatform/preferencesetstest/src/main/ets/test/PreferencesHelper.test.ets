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
//import featureAbility from '@ohos.ability.featureAbility';

const NAME = "test_preferences";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
const KEY_TEST_INT_ELEMENT = "key_test_int";
var mPreferences;
var context;
export default function preferencesHelperTest() {
  describe("preferencesHelperTest", function () {
    beforeAll(async function () {
      console.info("beforeAll");
      context = globalThis.abilityContext;
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    });

    afterAll(async function () {
      console.info("afterAll");
      await dataPreferences.deletePreferences(context, NAME);
    });

    function sleep(ms) {
      return new Promise((resolve) => setTimeout(resolve, ms));
    }

    /**
     * @tc.number : TEST_GET_PREFERENCES_HELPER_0001
     * @tc.name   : testGetPreferencesHelper0001
     * @tc.desc   : GetPreferencesSync interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetPreferencesHelper0001", 0, async function () {
      mPreferences = await dataPreferences.getPreferences(context, NAME);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      var value = await mPreferences.get(KEY_TEST_STRING_ELEMENT, 0);
      expect(value).assertEqual("test");
    });

    /**
     * @tc.number : TEST_GET_PREFERENCES_HELPER_0002
     * @tc.name   : testGetPreferencesHelper0002
     * @tc.desc   : GetPreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGetPreferencesHelper0002", 0, async function (done) {
      const promise = dataPreferences.getPreferences(context, NAME);
      let preferences = null;
      promise
        .then(async (pref) => {
          preferences = pref;
          expect(preferences != null).assertTrue();
          console.info("Succeeded in getting preferences.");
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_GET_PREFERENCES_HELPER_0003
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
        expect(false).assertTrue();
      } catch (err) {
        console.info("testGetPreferencesHelper0003 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'name' must be a without path non empty string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_GET_PREFERENCES_HELPER_0004
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
        expect(false).assertTrue();
      } catch (err) {
        console.info("testGetPreferencesHelper0004 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_HELPER_0001
     * @tc.name   : testRemovePreferencesFromCacheHelper0001
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0001", 0, async function (done) {
      await dataPreferences.getPreferences(context, NAME);
      const promise = dataPreferences.removePreferencesFromCache(context, NAME);
      promise
        .then(() => {
          console.info("Succeeded in removing preferences.");
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_HELPER_0002
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
        expect(false).assertTrue();
      } catch (err) {
        console.info("testRemovePreferencesFromCacheHelper0002 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_HELPER_0003
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
        expect(false).assertTrue();
      } catch (err) {
        console.info("testRemovePreferencesFromCacheHelper0003 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'name' must be a without path non empty string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_HELPER_0004
     * @tc.name   : testRemovePreferencesFromCacheHelper0004
     * @tc.desc   : RemovePreferencesFromCache interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCacheHelper0004", 0, async function (done) {
      let preferences = null;
      preferences = await dataPreferences.getPreferences(context, NAME);
      await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
      preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, ret) {
        expect("test").assertEqual(ret);
      });
      dataPreferences
        .removePreferencesFromCache(context, "test_preferences1")
        .then(() => {
          console.info("Succeeded in removing preferences.");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
            expect("test").assertEqual(pre);
            done();
          });
        })
        .catch((err) => {
          console.info("Remove preferences from cache error: " + err);
          done();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_HELPER_0001
     * @tc.name   : testPreferencesDeleteHelper0001
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0001", 0, async function (done) {
      let preferences = null;
      preferences = await dataPreferences.getPreferences(context, NAME);
      const promise = dataPreferences.deletePreferences(context, NAME);
      promise
        .then(() => {
          console.info("Succeeded in deleting preferences.");
          done();
        })
        .catch((err) => {
          console.info("Delete preferences err: " + err);
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_HELPER_0002
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
        expect(false).assertTrue();
      } catch (err) {
        console.info("testPreferencesDeleteHelper0002 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_HELPER_0003
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
        expect(false).assertTrue();
      } catch (err) {
        console.info("testPreferencesDeleteHelper0003 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'name' must be a without path non empty string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_HELPER_0004
     * @tc.name   : testPreferencesDeleteHelper0004
     * @tc.desc   : DeletePreferences interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteHelper0004", 0, async function (done) {
      let preferences = null;
      preferences = await dataPreferences.getPreferences(context, NAME);
      await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
      preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, ret) {
        expect("test").assertEqual(ret);
      });
      dataPreferences
        .deletePreferences(context, "test_preferences1")
        .then(() => {
          console.info("Succeeded in deleting preferences.");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
            expect("test").assertEqual(pre);
            done();
          });
        })
        .catch((err) => {
          console.info("Delete preferences err: " + err);
          done();
        });
    });

    /**
     * @tc.number  : TEST_MAX_KEY_LENGTH_001
     * @tc.name    : testMaxKeyLength001
     * @tc.desc    : Test key length
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 0
     */
    it("testMaxKeyLength001", 0, function () {
      expect(dataPreferences.MAX_KEY_LENGTH == 80).assertTrue();
    });

    /**
     * @tc.number  : TEST_MAX_VALUE_LENGTH_001
     * @tc.name    : testMaxValueLength001
     * @tc.desc    : Test value length
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 0
     */
    it("testMaxValueLength001", 0, function () {
      expect(dataPreferences.MAX_VALUE_LENGTH == 8192).assertTrue();
    });

    /**
     * @tc.number  : TEST_PREFERENCES_ON_001
     * @tc.name    : testPreferencesOn001
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOn001", 0, async function () {
      try {
        await mPreferences.clear();
        var observer = function (key) {
          console.info("testPreferencesOn001 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on("change", observer);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abcd");
        await mPreferences.flush();
      } catch (err) {
        console.info("Failed to testPreferencesOn001. code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : TEST_PREFERENCES_ON_002
     * @tc.name    : testPreferencesOn002
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOn002", 0, async function () {
      try {
        await mPreferences.clear();
        var observer = function (key) {
          console.info("testPreferencesOn002 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on("change");
        expect(false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOn002. code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 parameters!");
      }
    });

    /**
     * @tc.number  : TEST_PREFERENCES_ON_003
     * @tc.name    : testPreferencesOn003
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOn003", 0, async function () {
      try {
        await mPreferences.clear();
        var observer = function (key) {
          console.info("testPreferencesOn003 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on(null, observer);
        expect(false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOn003. code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'type' must be string 'change'.");
      }
    });

    /**
     * @tc.number  : TEST_PREFERENCES_ON_004
     * @tc.name    : testPreferencesOn004
     * @tc.desc    : Test on interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOn004", 0, async function () {
      try {
        await mPreferences.clear();
        var observer = function (key) {
          console.info("testPreferencesOn004 key " + key);
          expect(KEY_TEST_STRING_ELEMENT).assertEqual(key);
        };
        mPreferences.on("", observer);
        expect(false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOn004. code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'type' must be string 'change'.");
      }
    });

    /**
     * @tc.number  : TEST_PREFERENCES_OFF_001
     * @tc.name    : testPreferencesOff001
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOff001", 0, async function () {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        var observer = function (key) {
          console.info("testPreferencesOff001 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off("change", observer);
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        await mPreferences.flush();
        await sleep(1000);
        expect(isTrigger == false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOff001. code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : TEST_PREFERENCES_OFF_002
     * @tc.name    : testPreferencesOff002
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOff002", 0, async function () {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        var observer = function (key) {
          console.info("testPreferencesOff001 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off("change");
        await mPreferences.put(KEY_TEST_STRING_ELEMENT, "abc");
        await mPreferences.flush();
        await sleep(1000);
        expect(isTrigger == false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOff001. code =" + err.code + ", message =" + err.message);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  : TEST_PREFERENCES_OFF_003
     * @tc.name    : testPreferencesOff003
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOff003", 0, async function () {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        var observer = function (key) {
          console.info("testPreferencesOff003 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off(null);
        expect(false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOff003. code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'type' must be string 'change'.");
      }
    });

    /**
     * @tc.number  : TEST_PREFERENCES_OFF_004
     * @tc.name    : testPreferencesOff004
     * @tc.desc    : Test off interface
     * @tc.size    : MediumTest
     * @tc.type    : Constant
     * @tc.level   : Level 2
     */
    it("testPreferencesOff004", 0, async function () {
      try {
        await mPreferences.clear();
        let isTrigger = false;
        var observer = function (key) {
          console.info("testPreferencesOff004 key" + key);
          isTrigger = true;
        };
        mPreferences.on("change", observer);
        mPreferences.off("");
        expect(false).assertTrue();
      } catch (err) {
        console.info("Failed to testPreferencesOff004. code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'type' must be string 'change'.");
      }
    });
  });
}
