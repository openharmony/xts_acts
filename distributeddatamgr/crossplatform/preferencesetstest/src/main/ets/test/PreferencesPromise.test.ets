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

export default function preferencesPromiseTest() {
  describe("preferencesPromiseTest", function () {
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
     * @tc.number : TEST_PREFERENCES_GET_DEF_VALUE_PROMISE_0001
     * @tc.name   : testPreferencesGetDefValuePromise0001
     * @tc.desc   : Get defaultValue promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetDefValuePromise0001", 0, async function (done) {
      await mPreferences.clear();
      const promise = mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultValue");
      promise
        .then((ret) => {
          expect("defaultValue").assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_FLOAT_PROMISE_0001
     * @tc.name   : testPreferencesGetFloatPromise0001
     * @tc.desc   : Get float promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetFloatPromise0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      const promise = mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      promise
        .then((ret) => {
          expect(3.0).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_INT_PROMISE_0001
     * @tc.name   : testPreferencesGetIntPromise0001
     * @tc.desc   : Get int promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetIntPromise0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 3);
      const promise = mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
      promise
        .then((ret) => {
          expect(3).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_LONG_PROMISE_0001
     * @tc.name   : testPreferencesGetLongPromise0001
     * @tc.desc   : Get long promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetLongPromise0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 3);
      const promise = mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
      promise
        .then((ret) => {
          expect(3).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_STRING_PROMISE_0001
     * @tc.name   : testPreferencesGetStringPromise0001
     * @tc.desc   : Get string promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetStringPromise0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      const promise = mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      promise
        .then((ret) => {
          expect("test").assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_BOOLEAN_PROMISE_0001
     * @tc.name   : testPreferencesGetBooleanPromise0001
     * @tc.desc   : Get boolean promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetBooleanPromise0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, true);
      let promise = mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, true);
      promise
        .then((ret) => {
          expect(true).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_STRING_ARRAY_PROMISE_0001
     * @tc.name   : testPreferencesGetStringArrayPromise0001
     * @tc.desc   : Get StringArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetStringArrayPromise0001", 0, async function (done) {
      await mPreferences.clear();
      var stringArr = ["11", "22", "33"];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      let promise = mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"]);
      promise
        .then((pre) => {
          for (let i = 0; i < stringArr.length; i++) {
            expect(stringArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_NUM_ARRAY_PROMISE_0001
     * @tc.name   : testPreferencesGetNumArrayPromise0001
     * @tc.desc   : Get NumArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetNumArrayPromise0001", 0, async function (done) {
      await mPreferences.clear();
      var doubleArr = [11, 22, 33];
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      let promise = mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321]);
      promise
        .then((pre) => {
          for (let i = 0; i < doubleArr.length; i++) {
            expect(doubleArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_BOOL_ARRAY_PROMISE_0001
     * @tc.name   : testPreferencesGetBoolArrayPromise0001
     * @tc.desc   : Get BoolArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetBoolArrayPromise0001", 0, async function (done) {
      await mPreferences.clear();
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      let promise = mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [true, false]);
      promise
        .then((pre) => {
          for (let i = 0; i < boolArr.length; i++) {
            expect(boolArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_DEFAULT_VALUE_0001
     * @tc.name   : testPreferencesGetSyncDefaultValue0001
     * @tc.desc   : GetSync defaultValue interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncDefaultValue0001", 0, async function (done) {
      await mPreferences.clear();
      let ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultValue");
      expect("defaultValue").assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_FLOAT_0001
     * @tc.name   : testPreferencesGetSyncFloat0001
     * @tc.desc   : GetSync float interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncFloat0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      let ret = mPreferences.getSync(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(3.0).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_INT_0001
     * @tc.name   : testPreferencesGetSyncInt0001
     * @tc.desc   : GetSync int interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncInt0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 3);
      let ret = mPreferences.getSync(KEY_TEST_INT_ELEMENT, 0);
      expect(3).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_LONG_0001
     * @tc.name   : testPreferencesGetSyncLong0001
     * @tc.desc   : GetSync long interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncLong0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 3);
      let ret = mPreferences.getSync(KEY_TEST_LONG_ELEMENT, 0);
      expect(3).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_STRING_0001
     * @tc.name   : testPreferencesGetSyncString0001
     * @tc.desc   : GetSync string interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncString0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      let ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      expect("test").assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_BOOLEAN_0001
     * @tc.name   : testPreferencesGetSyncBoolean0001
     * @tc.desc   : GetSync string interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncBoolean0001", 0, async function (done) {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, true);
      let ret = mPreferences.getSync(KEY_TEST_STRING_ELEMENT, true);
      expect(true).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_STRING_ARRAY_0001
     * @tc.name   : testPreferencesGetSyncStringArray0001
     * @tc.desc   : GetSync stringArray interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncBoolean0001", 0, async function (done) {
      await mPreferences.clear();
      var stringArr = ["11", "22", "33"];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      let ret = mPreferences.getSync(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"]);
      for (let i = 0; i < stringArr.length; i++) {
        expect(stringArr[i]).assertEqual(ret[i]);
      }
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_NUM_ARRAY_0001
     * @tc.name   : testPreferencesGetSyncNumArray0001
     * @tc.desc   : GetSync numArray interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncBoolean0001", 0, async function (done) {
      await mPreferences.clear();
      var doubleArr = [11, 22, 33];
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      let ret = mPreferences.getSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321]);
      for (let i = 0; i < doubleArr.length; i++) {
        expect(doubleArr[i]).assertEqual(ret[i]);
      }
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_SYNC_BOOL_ARRAY_0001
     * @tc.name   : testPreferencesGetSyncBoolArray0001
     * @tc.desc   : GetSync boolArray interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetSyncBoolArray0001", 0, async function (done) {
      await mPreferences.clear();
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      let ret = mPreferences.getSync(KEY_TEST_BOOL_ARRAY_ELEMENT, [true, false]);
      for (let i = 0; i < boolArr.length; i++) {
        expect(boolArr[i]).assertEqual(ret[i]);
      }
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_ALL_PROMISE_0001
     * @tc.name   : testPreferencesGetAllPromise0001
     * @tc.desc   : GetAll promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetAllPromise0001", 0, async function (done) {
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

      let promise = mPreferences.getAll();
      promise
        .then((obj) => {
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
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_GET_ALL_SYNC_0001
     * @tc.name   : testPreferencesGetAllSync0001
     * @tc.desc   : GetAllSync interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesGetAllSync0001", 0, async function (done) {
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
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_FLOAT_PROMISE_0001
     * @tc.name   : testPreferencesPutFloatPromise0001
     * @tc.desc   : Put float promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutFloatPromise0001", 0, async function (done) {
      await mPreferences.clear();
      const promise = mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 4.0);
      await promise;
      let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(4.0).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(4.0).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_INT_PROMISE_0001
     * @tc.name   : testPreferencesPutIntPromise0001
     * @tc.desc   : Put int promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutIntPromise0001", 0, async function (done) {
      await mPreferences.clear();
      let promise = mPreferences.put(KEY_TEST_INT_ELEMENT, 4);
      await promise;
      let per = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
      expect(4).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
      expect(4).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_LONG_PROMISE_0001
     * @tc.name   : testPreferencesPutLongPromise0001
     * @tc.desc   : Put long promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutLongPromise0001", 0, async function (done) {
      let promise = mPreferences.put(KEY_TEST_LONG_ELEMENT, 4);
      await promise;
      let per = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
      expect(4).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
      expect(4).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_STRING_PROMISE_0001
     * @tc.name   : testPreferencesPutStringPromise0001
     * @tc.desc   : Put string promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutStringPromise0001", 0, async function (done) {
      let promise = mPreferences.put(KEY_TEST_STRING_ELEMENT, "");
      await promise;
      let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      expect("").assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      expect("").assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_BOOLEAN_PROMISE_0001
     * @tc.name   : testPreferencesPutBooleanPromise0001
     * @tc.desc   : Put boolean promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutBooleanPromise0001", 0, async function (done) {
      await mPreferences.clear();
      let promise = mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, true);
      await promise;
      let per = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
      expect(true).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
      expect(true).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_STRING_ARRAY_PROMISE_0001
     * @tc.name   : testPreferencesPutStringArrayPromise0001
     * @tc.desc   : Put StringArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutStringArrayPromise0001", 0, async function (done) {
      await mPreferences.clear();
      var stringArr = ["1", "2", "3"];
      let promise1 = mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await promise1;
      let promise2 = mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"]);
      promise2
        .then((pre) => {
          for (let i = 0; i < stringArr.length; i++) {
            expect(stringArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_NUM_ARRAY_PROMISE_0001
     * @tc.name   : testPreferencesPutNumArrayPromise0001
     * @tc.desc   : Put NumberArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutNumArrayPromise0001", 0, async function (done) {
      await mPreferences.clear();
      var numberArr = [11, 22, 33, 44, 55];
      let promise1 = mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, numberArr);
      await promise1;
      let promise2 = mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321]);
      promise2
        .then((pre) => {
          for (let i = 0; i < numberArr.length; i++) {
            expect(numberArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_BOOL_ARRAY_PROMISE_0001
     * @tc.name   : testPreferencesPutBoolArrayPromise0001
     * @tc.desc   : Put BoolArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutBoolArrayPromise0001", 0, async function (done) {
      await mPreferences.clear();
      var boolArr = [true, true, false];
      let promise1 = mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await promise1;
      let promise2 = mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [false, true]);
      promise2
        .then((pre) => {
          for (let i = 0; i < boolArr.length; i++) {
            expect(boolArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_FLOAT_0001
     * @tc.name   : testPreferencesPutSyncFloat0001
     * @tc.desc   : PutSync float promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncFloat0001", 0, async function (done) {
      await mPreferences.clear();
      mPreferences.putSync(KEY_TEST_FLOAT_ELEMENT, 4.0);
      let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(4.0).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(4.0).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_INT_0001
     * @tc.name   : testPreferencesPutSyncInt0001
     * @tc.desc   : PutSync int promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncInt0001", 0, async function (done) {
      await mPreferences.clear();
      mPreferences.putSync(KEY_TEST_INT_ELEMENT, 4);
      let per = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
      expect(4).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
      expect(4).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_LONG_0001
     * @tc.name   : testPreferencesPutSyncLong0001
     * @tc.desc   : PutSync long promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncLong0001", 0, async function (done) {
      mPreferences.putSync(KEY_TEST_LONG_ELEMENT, 4);
      let per = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
      expect(4).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
      expect(4).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_STRING_0001
     * @tc.name   : testPreferencesPutSyncString0001
     * @tc.desc   : PutSync string promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncString0001", 0, async function (done) {
      mPreferences.putSync(KEY_TEST_STRING_ELEMENT, "");
      let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      expect("").assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
      expect("").assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_BOOLEAN_0001
     * @tc.name   : testPreferencesPutSyncBoolean0001
     * @tc.desc   : PutSync boolean promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncBoolean0001", 0, async function (done) {
      await mPreferences.clear();
      mPreferences.putSync(KEY_TEST_BOOLEAN_ELEMENT, true);
      let per = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
      expect(true).assertEqual(per);
      await mPreferences.flush();
      let per2 = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
      expect(true).assertEqual(per2);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_STRING_ARRAY_0001
     * @tc.name   : testPreferencesPutSyncStringArray0001
     * @tc.desc   : PutSync StringArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncStringArray0001", 0, async function (done) {
      await mPreferences.clear();
      var stringArr = ["1", "2", "3"];
      mPreferences.putSync(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      let promise2 = mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"]);
      promise2
        .then((pre) => {
          for (let i = 0; i < stringArr.length; i++) {
            expect(stringArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_NUM_ARRAY_0001
     * @tc.name   : testPreferencesPutSyncNumArray0001
     * @tc.desc   : PutSync NumberArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncNumArray0001", 0, async function (done) {
      await mPreferences.clear();
      var numberArr = [11, 22, 33, 44, 55];
      mPreferences.putSync(KEY_TEST_NUMBER_ARRAY_ELEMENT, numberArr);
      let promise2 = mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321]);
      promise2
        .then((pre) => {
          for (let i = 0; i < numberArr.length; i++) {
            expect(numberArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_PUT_SYNC_BOOL_ARRAY_0001
     * @tc.name   : testPreferencesPutSyncBoolArray0001
     * @tc.desc   : PutSync BoolArray promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesPutSyncBoolArray0001", 0, async function (done) {
      await mPreferences.clear();
      var boolArr = [true, true, false];
      mPreferences.putSync(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      let promise2 = mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [false, true]);
      promise2
        .then((pre) => {
          for (let i = 0; i < boolArr.length; i++) {
            expect(boolArr[i]).assertEqual(pre[i]);
          }
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_PROMISE_0001
     * @tc.name   : testPreferencesHasKeyPromise0001
     * @tc.desc   : Has float promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKeyPromise0001", 0, async function (done) {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 2.0);
      const promise = mPreferences.has(KEY_TEST_FLOAT_ELEMENT);
      promise
        .then((ret) => {
          expect(true).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_PROMISE_0002
     * @tc.name   : testPreferencesHasKeyPromise0002
     * @tc.desc   : Has int promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKeyPromise0002", 0, async function (done) {
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 1);
      const promise = mPreferences.has(KEY_TEST_INT_ELEMENT);
      promise
        .then((ret) => {
          expect(true).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_PROMISE_0003
     * @tc.name   : testPreferencesHasKeyPromise0003
     * @tc.desc   : Has long promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKeyPromise0003", 0, async function (done) {
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 0);
      const promise = mPreferences.has(KEY_TEST_LONG_ELEMENT);
      promise
        .then((ret) => {
          expect(true).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_PROMISE_0004
     * @tc.name   : testPreferencesHasKeyPromise0004
     * @tc.desc   : Has string promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKeyPromise0004", 0, async function (done) {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      const promise = mPreferences.has(KEY_TEST_STRING_ELEMENT);
      promise
        .then((ret) => {
          expect(true).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_KEY_PROMISE_0005
     * @tc.name   : testPreferencesHasKeyPromise0005
     * @tc.desc   : Has boolean promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKeyPromise0005", 0, async function (done) {
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      const promise = mPreferences.has(KEY_TEST_BOOLEAN_ELEMENT);
      promise
        .then((ret) => {
          expect(true).assertEqual(ret);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_SYNC_0001
     * @tc.name   : testPreferencesHasSync0001
     * @tc.desc   : HasSync float interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasSync0001", 0, async function (done) {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 2.0);
      let ret = mPreferences.hasSync(KEY_TEST_FLOAT_ELEMENT);
      expect(true).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_SYNC_0002
     * @tc.name   : testPreferencesHasSync0002
     * @tc.desc   : HasSync int interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasSync0002", 0, async function (done) {
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 1);
      let ret = mPreferences.hasSync(KEY_TEST_INT_ELEMENT);
      expect(true).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_SYNC_0003
     * @tc.name   : testPreferencesHasSync0003
     * @tc.desc   : HasSync long interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasSync0003", 0, async function (done) {
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 0);
      let ret = mPreferences.hasSync(KEY_TEST_LONG_ELEMENT);
      expect(true).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_SYNC_0004
     * @tc.name   : testPreferencesHasSync0004
     * @tc.desc   : HasSync string interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKeyPromise0004", 0, async function (done) {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      let ret = mPreferences.hasSync(KEY_TEST_STRING_ELEMENT);
      expect(true).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_HAS_SYNC_0005
     * @tc.name   : testPreferencesHasSync0005
     * @tc.desc   : HasSync boolean interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesHasSync0005", 0, async function (done) {
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      let ret = mPreferences.hasSync(KEY_TEST_BOOLEAN_ELEMENT);
      expect(true).assertEqual(ret);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_CLEAR_PROMISE_0001
     * @tc.name   : testPreferencesClearPromise0001
     * @tc.desc   : Clear promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesClearPromise0001", 0, async function (done) {
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

      const promise = mPreferences.clear();
      promise
        .then(async () => {
          let ret = mPreferences.getAllSync();
          console.log("testPreferencesClearPromise0001 end." + JSON.stringify(ret.key_test_string));
          expect(undefined).assertEqual(ret.key_test_boolean);
          expect(undefined).assertEqual(ret.key_test_string);
          expect(undefined).assertEqual(ret.key_test_float);
          expect(undefined).assertEqual(ret.key_test_string_array);
          expect(undefined).assertEqual(ret.key_test_bool_array);
          expect(undefined).assertEqual(ret.key_test_number_array);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_CLEAR_SYNC_0001
     * @tc.name   : testPreferencesClearSync0001
     * @tc.desc   : ClearSync interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesClearSync0001", 0, async function (done) {
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

      mPreferences.clearSync();
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

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_PROMISE_0001
     * @tc.name   : testPreferencesDeletePromise0001
     * @tc.desc   : Delete promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePromise0001", 0, async function (done) {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      let ret = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(3.0).assertEqual(ret);
      await mPreferences.flush();
      const promise = mPreferences.delete(KEY_TEST_FLOAT_ELEMENT);
      promise
        .then(async () => {
          let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
          expect(0.0).assertEqual(per);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });

    /**
     * @tc.number : TEST_PREFERENCES_DELETE_SYNC_0001
     * @tc.name   : testPreferencesDeleteSync0001
     * @tc.desc   : DeleteSync interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesDeleteSync0001", 0, async function (done) {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      let ret = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(3.0).assertEqual(ret);
      await mPreferences.flush();
      mPreferences.deleteSync(KEY_TEST_FLOAT_ELEMENT);
      let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(0.0).assertEqual(per);
      done();
    });

    /**
     * @tc.number : TEST_PREFERENCES_FLUSH_PROMISE_0001
     * @tc.name   : testPreferencesFlushPromise0001
     * @tc.desc   : Flush promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Method
     * @tc.level  : Level 2
     */
    it("testPreferencesFlushPromise0001", 0, async function (done) {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      const promise = mPreferences.flush();
      promise
        .then(async () => {
          let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
          expect("test").assertEqual(per);
          done();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
    });
  });
}
