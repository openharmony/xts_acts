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
// import featureAbility from '@ohos.ability.featureAbility';

const NAME = "test_preferences";
const KEY_TEST_INT_ELEMENT = "key_test_int";
const KEY_TEST_LONG_ELEMENT = "key_test_long";
const KEY_TEST_FLOAT_ELEMENT = "key_test_float";
const KEY_TEST_BOOLEAN_ELEMENT = "key_test_boolean";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
const KEY_TEST_NUMBER_ARRAY_ELEMENT = "key_test_number_array";
const KEY_TEST_STRING_ARRAY_ELEMENT = "key_test_string_array";
const KEY_TEST_BOOL_ARRAY_ELEMENT = "key_test_bool_array";
var mPreferences;
var context;

const TAG = "[PREFERENCES_CALLBACK_JSUNIT_TEST]";
export default function preferencesCallBackTest() {
  describe("preferencesCallBackTest", function () {
    beforeAll(async function () {
      console.info("beforeAll");
      // context = featureAbility.getContext()
      context = globalThis.abilityContext;
      mPreferences = await dataPreferences.getPreferences(context, NAME);
    });

    afterAll(async function () {
      console.info("afterAll");
      await dataPreferences.deletePreferences(context, NAME);
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_PREFERENCES_0001
     * @tc.name   : testPreferencesGetPreferences0001
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences0001", 0, async function (done) {
      const NAME = "getPreferencesTest";
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success" + preferences);
          expect(preferences != null).assertTrue();
          done();
        }
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_PREFERENCES_0002
     * @tc.name   : testPreferencesGetPreferences0002
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences0002", 0, async function (done) {
      try {
        // @ts-ignore
        await dataPreferences.getPreferences(context, -1, (err, preferences) => {
          if (err != null) {
            console.info(TAG + "Get preferences err: " + err);
            done();
          } else {
            console.info(TAG + "Get preferences success" + preferences);
            expect(preferences != null).assertTrue();
          }
        });
      } catch (err) {
        console.info("testPreferencesGetPreferences0002 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'name' must be a without path non empty string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_PREFERENCES_0003
     * @tc.name   : testPreferencesGetPreferences0003
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences0003", 0, async function (done) {
      try {
        // @ts-ignore
        dataPreferences.getPreferences(context, (err, preferences) => {
          if (err != null) {
            console.info(TAG + "Get preferences err: " + JSON.stringify(err));
            done();
          } else {
            console.info(TAG + "Get preferences success" + preferences);
            expect(preferences != null).assertTrue();
          }
        });
      } catch (err) {
        console.info("testPreferencesGetPreferences0003 fail: " + err.message + "code: " + err.code);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_PREFERENCES_0001
     * @tc.name   : testPreferencesDeletePreferences0001
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences0001", 0, async function (done) {
      const NAME = "getPreferencesTest";
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          dataPreferences.deletePreferences(context, NAME, (err) => {
            console.info(TAG + "Delete preferences success");
            expect(err == null).assertTrue();
            done();
          });
        }
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_PREFERENCES_0002
     * @tc.name   : testPreferencesDeletePreferences0002
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences0002", 0, async function (done) {
      const NAME = "getPreferencesTest";
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          try {
            // @ts-ignore
            dataPreferences.deletePreferences(context, (err) => {
              if (err != null) {
                console.info(TAG + "Delete preferences err: " + err);
                done();
              }
            });
          } catch (err) {
            console.info("testPreferencesDeletePreferences0002 fail: " + err.message + "code: " + err.code);
            expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_PREFERENCES_0003
     * @tc.name   : testPreferencesDeletePreferences0003
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences0003", 0, async function (done) {
      const NAME = "getPreferencesTest";
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          try {
            // @ts-ignore
            dataPreferences.deletePreferences(context, -1, (err) => {
              if (err != null) {
                console.info(TAG + "Delete preferences err: " + err);
                done();
              }
            });
          } catch (err) {
            console.info("testPreferencesDeletePreferences0003 fail: " + err.message + "code: " + err.code);
            expect(err.code == 401 && err.message == "Parameter error. The type of 'name' must be a without path non empty string.").assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_PREFERENCES_0004
     * @tc.name   : testPreferencesDeletePreferences0004
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences0004", 0, async function (done) {
      const NAME = "getPreferencesTest";
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          try {
            preferences.put(KEY_TEST_STRING_ELEMENT, "test");
            preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, ret) {
              expect("test").assertEqual(ret);
            });
            // @ts-ignore
            dataPreferences.deletePreferences(context, "getPreferencesTest1", (err) => {
              console.info(TAG + "Delete preferences success");
              preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
                expect("test").assertEqual(pre);
              });
              preferences.delete(KEY_TEST_STRING_ELEMENT);
              done();
            });
          } catch (err) {
            console.info("testPreferencesDeletePreferences0004 fail: " + err.message + "code: " + err.code);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_0001
     * @tc.name   : testRemovePreferencesFromCache0001
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache0001", 0, async function (done) {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          dataPreferences.removePreferencesFromCache(context, NAME, (err) => {
            console.info(TAG + "Remove preferences from cache success");
            expect(err == null).assertTrue();
            done();
          });
        }
      });
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_0002
     * @tc.name   : testRemovePreferencesFromCache0002
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache0002", 0, async function (done) {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          try {
            // @ts-ignore
            dataPreferences.removePreferencesFromCache(context, (err) => {
              if (err != null) {
                console.info(TAG + "Remove preferences from cache error: " + err);
                done();
              }
            });
          } catch (err) {
            console.info("testRemovePreferencesFromCache0002 fail: " + err.message + "code: " + err.code);
            expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_0003
     * @tc.name   : testRemovePreferencesFromCache0003
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache0003", 0, async function (done) {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          try {
            // @ts-ignore
            dataPreferences.removePreferencesFromCache(context, -1, (err) => {
              if (err != null) {
                console.info(TAG + "Remove preferences from cache error: " + err);
                done();
              }
            });
          } catch (err) {
            console.info("testRemovePreferencesFromCache0003 fail: " + err.message + "code: " + err.code);
            expect(err.code == 401 && err.message == "Parameter error. The type of 'name' must be a without path non empty string.").assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : TEST_REMOVE_PREFERENCES_FROM_CACHE_0004
     * @tc.name   : testRemovePreferencesFromCache0004
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache0004", 0, async function (done) {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err != null) {
          console.info(TAG + "Get preferences err: " + err);
          expect(false).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences != null).assertTrue();
          try {
            // @ts-ignore
            dataPreferences.removePreferencesFromCache(context, "getPreferencesTest1", (err) => {
              if (err != null) {
                console.info(TAG + "Remove preferences from cache error: " + err);
                done();
              } else {
                preferences.put(KEY_TEST_STRING_ELEMENT, "test");
                preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, ret) {
                  expect("test").assertEqual(ret);
                });
                console.info(TAG + "Remove preferences from cache success1");
                preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
                  expect("test").assertEqual(pre);
                });
                preferences.delete(KEY_TEST_STRING_ELEMENT);
                done();
              }
            });
          } catch (err) {
            console.info("testRemovePreferencesFromCache0004 fail: " + err.message + "code: " + err.code);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_DEFAULT_VALUE_0001
     * @tc.name   : testPreferencesGetDefaultValue0001
     * @tc.desc   : Get defaultValue callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetDefaultValue0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultValue", function (err, ret) {
        expect("defaultValue").assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_FLOAT_0001
     * @tc.name   : testPreferencesGetFloat0001
     * @tc.desc   : Get float callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetFloat0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0, function (err, ret) {
        expect(3.0).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_INT_0001
     * @tc.name   : testPreferencesGetInt0001
     * @tc.desc   : Get int callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetInt0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 3);
      await mPreferences.get(KEY_TEST_INT_ELEMENT, 0.0, function (err, ret) {
        expect(3).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_LONG_0001
     * @tc.name   : testPreferencesGetLong0001
     * @tc.desc   : Get long callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetLong0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 3);
      await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0, function (err, ret) {
        expect(3).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_STRING_0001
     * @tc.name   : testPreferencesGetString0001
     * @tc.desc   : Get String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetString0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, ret) {
        expect("test").assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_BOOLEAN_0001
     * @tc.name   : testPreferencesGetBoolean0001
     * @tc.desc   : Get Boolean callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetBoolean0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, true);
      await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, true, function (err, ret) {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_STRING_ARRAY_0001
     * @tc.name   : testPreferencesGetStringArray0001
     * @tc.desc   : Get StringArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetStringArray0001", 0, async function (done) {
      await mPreferences.clear();
      var stringArr = ["11", "22", "33"];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"], function (err, pre) {
        for (let i = 0; i < stringArr.length; i++) {
          expect(stringArr[i]).assertEqual(pre[i]);
        }
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_NUM_ARRAY_0001
     * @tc.name   : testPreferencesGetNumArray0001
     * @tc.desc   : Get NumArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetNumArray0001", 0, async function (done) {
      await mPreferences.clear();
      var doubleArr = [11, 22, 33];
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321], function (err, pre) {
        for (let i = 0; i < doubleArr.length; i++) {
          expect(doubleArr[i]).assertEqual(pre[i]);
        }
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_BOOL_ARRAY_0001
     * @tc.name   : testPreferencesGetBoolArray0001
     * @tc.desc   : Get BoolArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetBoolArray0001", 0, async function (done) {
      await mPreferences.clear();
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [true, false], function (err, pre) {
        for (let i = 0; i < boolArr.length; i++) {
          expect(boolArr[i]).assertEqual(pre[i]);
        }
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_ALL_0001
     * @tc.name   : testPreferencesGetAll0001
     * @tc.desc   : GetAll callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetAll0001", 0, async function (done) {
      await mPreferences.clear();
      let doubleArr = [11, 22, 33];
      let stringArr = ["11", "22", "33"];
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences.flush();

      await mPreferences.getAll(function (err, obj) {
        expect(false).assertEqual(obj.key_test_boolean);
        expect("123").assertEqual(obj.key_test_string);
        expect(123.1).assertEqual(obj.key_test_float);
        let sArr = obj.key_test_string_array;
        for (let i = 0; i < sArr.length; i++) {
          expect(sArr[i]).assertEqual(stringArr[i]);
        }

        let bArr = obj.key_test_bool_array;
        for (let i = 0; i < bArr.length; i++) {
          expect(bArr[i]).assertEqual(boolArr[i]);
        }

        let nArr = obj.key_test_number_array;
        for (let i = 0; i < nArr.length; i++) {
          expect(nArr[i]).assertEqual(doubleArr[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_FLOAT_0001
     * @tc.name   : testPreferencesPutFloat0001
     * @tc.desc   : Put float callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutFloat0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 4.0, async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(4.0).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(4.0).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_INT_0001
     * @tc.name   : testPreferencesPutInt0001
     * @tc.desc   : Put int callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutInt0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 4, async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
        expect(4).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
        expect(4).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_LONG_0001
     * @tc.name   : testPreferencesPutLong0001
     * @tc.desc   : Put long callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutLong0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 4);
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 4, async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
        expect(4).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
        expect(4).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_STRING_0001
     * @tc.name   : testPreferencesPutString0001
     * @tc.desc   : Put String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutString0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "", async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("").assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("").assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_BOOLEAN_0001
     * @tc.name   : testPreferencesPutBoolean0001
     * @tc.desc   : Put Boolean callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutBoolean0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, true, async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
        expect(true).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
        expect(true).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_STRING_ARRAY_0001
     * @tc.name   : testPreferencesPutStringArray0001
     * @tc.desc   : Put StringArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutStringArray0001", 0, async function (done) {
      await mPreferences.clear();
      var stringArr = ["11", "22", "33"];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr, async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"]);
        for (let i = 0; i < stringArr.length; i++) {
          expect(stringArr[i]).assertEqual(pre[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_NUM_ARRAY_0001
     * @tc.name   : testPreferencesPutNumArray0001
     * @tc.desc   : Put NumberArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutNumArray0001", 0, async function (done) {
      await mPreferences.clear();
      var doubleArr = [11, 22, 33];
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr, async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321]);
        for (let i = 0; i < doubleArr.length; i++) {
          expect(doubleArr[i]).assertEqual(pre[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_BOOL_ARRAY_0001
     * @tc.name   : testPreferencesPutBoolArray0001
     * @tc.desc   : Put BoolArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutBoolArray0001", 0, async function (done) {
      await mPreferences.clear();
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr, async function (err, ret) {
        let pre = await mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [true, false]);
        for (let i = 0; i < boolArr.length; i++) {
          expect(boolArr[i]).assertEqual(pre[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_0001
     * @tc.name   : testPreferencesHasKey0001
     * @tc.desc   : Has float callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0001", 0, async function (done) {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 1.1);
      await mPreferences.has(KEY_TEST_FLOAT_ELEMENT, function (err, ret) {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_0002
     * @tc.name   : testPreferencesHasKey0002
     * @tc.desc   : Has int callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0002", 0, async function (done) {
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 1);
      await mPreferences.has(KEY_TEST_INT_ELEMENT, function (err, ret) {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_0003
     * @tc.name   : testPreferencesHasKey0003
     * @tc.desc   : Has long callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0003", 0, async function (done) {
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 0);
      await mPreferences.has(KEY_TEST_LONG_ELEMENT, function (err, ret) {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_0004
     * @tc.name   : testPreferencesHasKey0004
     * @tc.desc   : Has string callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0004", 0, async function (done) {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.has(KEY_TEST_STRING_ELEMENT, function (err, ret) {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_0005
     * @tc.name   : testPreferencesHasKey0005
     * @tc.desc   : Has boolean callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0005", 0, async function (done) {
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.has(KEY_TEST_BOOLEAN_ELEMENT, function (err, ret) {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_CLEAR_0001
     * @tc.name   : testPreferencesClear0001
     * @tc.desc   : Clear callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesClear0001", 0, async function (done) {
      await mPreferences.clear();
      let doubleArr = [11, 22, 33];
      let stringArr = ["11", "22", "33"];
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences.flush();

      let obj = mPreferences.getAllSync();
      expect(false).assertEqual(obj.key_test_boolean);
      expect("123").assertEqual(obj.key_test_string);
      expect(123.1).assertEqual(obj.key_test_float);
      let sArr = obj.key_test_string_array;
      for (let i = 0; i < sArr.length; i++) {
        expect(sArr[i]).assertEqual(stringArr[i]);
      }

      let bArr = obj.key_test_bool_array;
      for (let i = 0; i < bArr.length; i++) {
        expect(bArr[i]).assertEqual(boolArr[i]);
      }

      let nArr = obj.key_test_number_array;
      for (let i = 0; i < nArr.length; i++) {
        expect(nArr[i]).assertEqual(doubleArr[i]);
      }

      await mPreferences.clear(async function (err) {
        let ret = mPreferences.getAllSync();
        console.log("testPreferencesClearPromise0001 end." + JSON.stringify(ret.key_test_string));
        expect(undefined).assertEqual(ret.key_test_boolean);
        expect(undefined).assertEqual(ret.key_test_string);
        expect(undefined).assertEqual(ret.key_test_float);
        expect(undefined).assertEqual(ret.key_test_string_array);
        expect(undefined).assertEqual(ret.key_test_bool_array);
        expect(undefined).assertEqual(ret.key_test_number_array);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_0001
     * @tc.name   : testPreferencesDelete0001
     * @tc.desc   : Delete callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesDelete0001", 0, async function (done) {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      let ret = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(3.0).assertEqual(ret);
      await mPreferences.flush();
      mPreferences.delete(KEY_TEST_FLOAT_ELEMENT, async (err, ret) => {
        if (err) {
          console.info("Failed to delete the key KEY_TEST_STRING_ELEMENT. code =" + err.code + ", message =" + err.message);
          expect(false).assertTrue();
        }
        console.info("Succeeded in deleting the key KEY_TEST_STRING_ELEMENT.");
        let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(0.0).assertEqual(per);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_FLUSH_0001
     * @tc.name   : testPreferencesFlush0001
     * @tc.desc   : Flush callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesFlush0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      mPreferences.flush(async function (err, val) {
        if (err) {
          console.info("Failed to flush. code =" + err.code + ", message =" + err.message);
          expect(false).assertTrue();
        }
        console.info("Succeeded in flushing.");
        expect(err == undefined).assertTrue();
        let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("test").assertEqual(per);
        done();
      });
    });

    /**
     * @tc.number : TEST_PREFERENCES_CALLBACK_0001
     * @tc.name   : testPreferencesCallback0001
     * @tc.desc   : Clear、Put、Get、Flush String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesCallback0001", 0, function (done) {
      console.log(TAG + "testPreferencesCallback0001 begin.");
      mPreferences.clear(function (err, val) {
        if (err) {
          expect(null).assertFail();
        }
        mPreferences.put(KEY_TEST_STRING_ELEMENT, "123", function (err) {
          if (err) {
            expect(null).assertFail();
          }
          mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
            if (err) {
              expect(null).assertFail();
            }
            expect("123").assertEqual(pre);
            mPreferences.flush(function (err) {
              if (err) {
                expect(null).assertFail();
              }
              mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre2) {
                if (err) {
                  expect(null).assertFail();
                }
                expect("123").assertEqual(pre2);
                done();
                console.log(TAG + "testPreferencesCallback0001 end.");
              });
            });
          });
        });
      });
    });
  });
}
