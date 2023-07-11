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
import data_preferences from "@ohos.data.preferences";
///import featureAbility from '@ohos.ability.featureAbility'

const NAME = "test_preferences_callback_with_error";
const KEY_TEST_INT_ELEMENT = "key_test_int";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
var mPreference = undefined;
var context;
export default function preferencesCallbackWithErrorTest() {
  describe("preferencesCallbackWithErrorTest", async function () {
    beforeAll(async function () {
      console.info("beforeAll");
      //context = featureAbility.getContext()
      context = globalThis.abilityContext;
      mPreference = await data_preferences.getPreferences(context, NAME);
    });

    afterAll(async function () {
      console.info("afterAll");
      await data_preferences.deletePreferences(context, NAME);
    });

    /**
     * @tc.number : TEST_PREFERENCES_CALLBACK_WITH_ERROR_0001
     * @tc.name   : testPreferencesCallbackWithError0001
     * @tc.desc   : Clear、Put、Has、Delete、Get、Flush String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesCallbackWithError0001", 0, function (done) {
      console.log("testPreferencesCallbackWithError0001 begin.");
      try {
        mPreference.clear(function (err, val) {
          if (err) {
            console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          }
          mPreference.put(KEY_TEST_STRING_ELEMENT, "abc", function (err, ret) {
            if (err) {
              console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
              expect(false).assertTrue();
            }
            mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
              if (err) {
                console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
                expect(false).assertTrue();
              }
              expect("abc").assertEqual(pre);
              mPreference.flush(function (err, val) {
                if (err) {
                  console.log("flush err =" + err + ", code =" + err.code + ", message =" + err.message);
                  expect(false).assertTrue();
                }
                mPreference.delete(KEY_TEST_STRING_ELEMENT, function (err) {
                  expect(err == null).assertTrue();
                  console.log("Succeeded in deleting .");
                  done();
                  console.log("testPreferencesCallbackWithError0001 end.");
                });
              });
            });
          });
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_0001
     * @tc.name   : testMpreferencesGet0001
     * @tc.desc   : mPreference.get callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGet0001", 0, function (done) {
      console.log("testMpreferencesGet0001 begin.");
      try {
        mPreference.get(123, function (err, val) {
          console.log("get err");
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!");
        done();
        console.log("testMpreferencesGet0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_0002
     * @tc.name   : testMpreferencesGet0002
     * @tc.desc   : mPreference.get callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGet0002", 0, function (done) {
      console.log("testMpreferencesGet0002 begin.");
      try {
        // @ts-ignore
        mPreference.get(-1, 123, function (err, val) {
          if (err) {
            console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
            done();
          }
          done();
          console.log("testMpreferencesGet0002 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.");
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_0003
     * @tc.name   : testMpreferencesGet0003
     * @tc.desc   : mPreference.get callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGet0003", 0, async function (done) {
      console.log("testMpreferencesGet0003 begin.");
      try {
        await mPreference.put(KEY_TEST_INT_ELEMENT, 3);
        // @ts-ignore
        mPreference.get(KEY_TEST_STRING_ELEMENT, 123, function (err, val) {
          if (err) {
            console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
            done();
          }
          expect(val != 3).assertTrue();
          done();
          console.log("testMpreferencesGet0003 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_ALL_0001
     * @tc.name   : testMpreferencesGetALL0001
     * @tc.desc   : mPreference.getAll callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetALL0001", 0, function (done) {
      console.log("testMpreferencesGetALL0001 begin.");
      try {
        mPreference.getAll(function (err, val) {
          if (err) {
            console.log("getAll err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          }
          console.log("getAll val = " + JSON.stringify(val));
          done();
          console.log("testMpreferencesGetALL0001 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_HAS_0001
     * @tc.name   : testMpreferencesHas0001
     * @tc.desc   : mPreference.has callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesHas0001", 0, function (done) {
      console.log("testMpreferencesHas0001 begin.");
      try {
        // @ts-ignore
        mPreference.has(123, function (err, val) {
          console.log("has err");
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.");
        done();
        console.log("testMpreferencesHas0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_HAS_0002
     * @tc.name   : testMpreferencesHas0002
     * @tc.desc   : mPreference.has callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesHas0002", 0, function (done) {
      console.log("testMpreferencesHas0002 begin.");
      try {
        mPreference.has(KEY_TEST_STRING_ELEMENT, function (err, val) {
          if (err) {
            console.log("has err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          }
          done();
          console.log("testMpreferencesHas0002 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_0001
     * @tc.name   : testMpreferencesPut0001
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0001", 0, function (done) {
      console.log("testMpreferencesPut0001 begin.");
      try {
        // @ts-ignore
        mPreference.put(123, function (err) {
          console.log("put err");
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.");
        done();
        console.log("testMpreferencesPut0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_0002
     * @tc.name   : testMpreferencesPut0002
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0002", 0, function (done) {
      console.log("testMpreferencesPut0002 begin.");
      try {
        // @ts-ignore
        mPreference.put(KEY_TEST_STRING_ELEMENT, "", async (err) => {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            done();
          }
          let pre = await mPreference.get(KEY_TEST_STRING_ELEMENT, "123");
          expect(pre == "").assertTrue();
          done();
          console.log("testMpreferencesPut0002 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_0003
     * @tc.name   : testMpreferencesPut0003
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0003", 0, function (done) {
      console.log("testMpreferencesPut0003 begin.");
      try {
        mPreference.put(KEY_TEST_STRING_ELEMENT, " ", async (err) => {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            //expect(false).assertTrue();
            done();
          }
          let pre = await mPreference.get(KEY_TEST_STRING_ELEMENT, "123");
          expect(pre == " ").assertTrue();
          done();
          console.log("testMpreferencesPut0003 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_0004
     * @tc.name   : testMpreferencesPut0004
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0004", 0, function (done) {
      console.log("testMpreferencesPut0004 begin.");
      try {
        // @ts-ignore
        mPreference.put(-1, 123, function (err) {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            done();
          }
          done();
          console.log("testMpreferencesPut0004 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.");
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_0004
     * @tc.name   : testMpreferencesPut0004
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0004", 0, function (done) {
      console.log("testMpreferencesPut0004 begin.");
      try {
        // @ts-ignore
        mPreference.put(KEY_TEST_STRING_ELEMENT, null, function (err) {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            done();
          }
          done();
          console.log("testMpreferencesPut0004 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be ValueType.");
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_DELETE_0001
     * @tc.name   : testMpreferencesDelete0001
     * @tc.desc   : mPreference.delete callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesDelete0001", 0, function (done) {
      console.log("testMpreferencesDelete0001 begin.");
      try {
        // @ts-ignore
        mPreference.delete(1233, function (err) {
          console.log("delete err");
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.");
        done();
        console.log("testMpreferencesDelete0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_DELETE_0002
     * @tc.name   : testMpreferencesDelete0002
     * @tc.desc   : mPreference.delete callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesDelete0002", 0, function (done) {
      console.log("testMpreferencesDelete0002 begin.");
      try {
        mPreference.delete(KEY_TEST_STRING_ELEMENT, function (err) {
          if (err) {
            console.log("delete err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          }
          done();
          console.log("testMpreferencesDelete0002 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_CLEAR_0001
     * @tc.name   : testMpreferencesClear0001
     * @tc.desc   : mPreference.clear callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesClear0001", 0, function (done) {
      console.log("testMpreferencesClear0001 begin.");
      try {
        mPreference.clear(function (err) {
          if (err) {
            console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          }
          done();
          console.log("testMpreferencesClear0001 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_FLUSH_0001
     * @tc.name   : testMpreferencesFlush0001
     * @tc.desc   : mPreference.flush callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesFlush0001", 0, function (done) {
      console.log("testMpreferencesFlush0001 begin.");
      try {
        mPreference.flush(function (err) {
          if (err) {
            console.log("flush err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          }
          done();
          console.log("testMpreferencesFlush0001 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });
  });
}
