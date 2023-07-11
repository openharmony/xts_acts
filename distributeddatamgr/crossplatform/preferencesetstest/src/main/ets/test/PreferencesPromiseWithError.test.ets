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
//import featureAbility from '@ohos.ability.featureAbility'

const NAME = "test_preferences_promise_with_error";
const KEY_TEST_INT_ELEMENT = "key_test_int";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
var mPreference;
var context;
export default function preferencesPromiseWithErrorTest() {
  describe("preferencesPromiseWithErrorTest", async function () {
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

    beforeEach(async function () {
      console.info("beforeEach");
      await mPreference.clear();
      await mPreference.flush();
    });

    /**
     * @tc.number : TEST_PREFERENCES_PROMISE_WITH_ERROR_0001
     * @tc.name   : testPreferencesPromiseWithError0001
     * @tc.desc   : Clear、Delete、Put、Get、Flush promise interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPromiseWithError0001", 0, function (done) {
      console.log("testPreferencesPromiseWithError0001 begin.");
      try {
        if (mPreference == undefined) {
          console.log("mPreference undefined");
          expect(false).assertTrue();
        }
        mPreference
          .clear()
          .then(() => {
            mPreference
              .put(KEY_TEST_INT_ELEMENT, 123)
              .then((ret) => {
                mPreference
                  .get(KEY_TEST_INT_ELEMENT, 123)
                  .then((pre) => {
                    expect(123).assertEqual(pre);
                    mPreference
                      .flush()
                      .then(() => {
                        mPreference
                          .delete(KEY_TEST_INT_ELEMENT)
                          .then(async () => {
                            console.log("Succeeded in deleting .");
                            let per = await mPreference.get(KEY_TEST_INT_ELEMENT, 0);
                            expect(0).assertEqual(per);
                            done();
                            console.log("testPreferencesPromiseWithError0001 end.");
                          })
                          .catch((err) => {
                            console.log("delete err =" + err + ", code =" + err.code + ", message =" + err.message);
                            expect(false).assertTrue();
                          });
                      })
                      .catch((err) => {
                        console.log("flush err =" + err + ", code =" + err.code + ", message =" + err.message);
                        expect(false).assertTrue();
                      });
                  })
                  .catch((err) => {
                    console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
                    expect(false).assertTrue();
                  });
              })
              .catch((err) => {
                console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
                expect(false).assertTrue();
              });
          })
          .catch((err) => {
            console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_PROMISE_0001
     * @tc.name   : testMpreferencesGetPromise0001
     * @tc.desc   : mPreference.get promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetPromise0001", 0, function (done) {
      console.log("testMpreferencesGetPromise0001 begin.");
      try {
        mPreference
          .get(1233)
          .then((ret) => {
            console.log("get err");
            expect(false).assertTrue();
          })
          .catch((err) => {
            console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
        done();
        console.log("testMpreferencesGetPromise0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_PROMISE_0002
     * @tc.name   : testMpreferencesGetPromise0002
     * @tc.desc   : mPreference.get promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetPromise0002", 0, async function (done) {
      console.log("testMpreferencesPromise0002 begin.");
      try {
        await mPreference.put(KEY_TEST_STRING_ELEMENT, "123");
        mPreference
          .get(-1, KEY_TEST_INT_ELEMENT)
          .then((ret) => {
            done();
            console.log("testMpreferencesGetPromise0002 end.");
          })
          .catch((err) => {
            console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_PROMISE_0003
     * @tc.name   : testMpreferencesGetPromise0003
     * @tc.desc   : mPreference.get promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetPromise0003", 0, async function (done) {
      console.log("testMpreferencesGetPromise0003 begin.");
      try {
        await mPreference.put(KEY_TEST_STRING_ELEMENT, "123");
        mPreference
          .get(KEY_TEST_INT_ELEMENT, "default")
          .then((ret) => {
            expect(ret != "123").assertTrue();
            done();
            console.log("testMpreferencesGetPromise0003 end." + JSON.stringify(ret));
          })
          .catch((err) => {
            console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_SYNC_WITH_ERROR_0001
     * @tc.name   : testMpreferencesGetSyncWithError0001
     * @tc.desc   : mPreference.getSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetSyncWithError0001", 0, function (done) {
      console.log("testMpreferencesGetSyncWithError0001 begin.");
      try {
        mPreference.getSync(1233);
        expect(false).assertTrue();
      } catch (err) {
        console.log("trycatch1 err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 parameters!").assertTrue();
        done();
        console.log("testMpreferencesGetSyncWithError0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_SYNC_WITH_ERROR_0002
     * @tc.name   : testMpreferencesGetSyncWithError0002
     * @tc.desc   : mPreference.getSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetSyncWithError0002", 0, async function (done) {
      console.log("testMpreferencesGetSyncWithError0002 begin.");
      try {
        await mPreference.put(KEY_TEST_STRING_ELEMENT, "123");
        mPreference.getSync(-1, KEY_TEST_INT_ELEMENT);
        expect(false).assertTrue();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_SYNC_WITH_ERROR_0003
     * @tc.name   : testMpreferencesGetSyncWithError0003
     * @tc.desc   : mPreference.getSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetSyncWithError0003", 0, async function (done) {
      console.log("testMpreferencesGetSyncWithError0003 begin.");
      try {
        await mPreference.put(KEY_TEST_STRING_ELEMENT, "123");
        let ret = mPreference.getSync(KEY_TEST_INT_ELEMENT, "default");
        expect(ret != "123").assertTrue();
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_GET_ALL_PROMISE_0001
     * @tc.name   : testMpreferencesGetALLPromise0001
     * @tc.desc   : mPreference.getAll promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetALLPromise0001", 0, function (done) {
      console.log("testMpreferencesGetALLPromise0001 begin.");
      try {
        mPreference
          .getAll()
          .then((ret) => {
            console.log("getAll val = " + JSON.stringify(ret));
            done();
            console.log("testMpreferencesGetALLPromise0001 end.");
          })
          .catch((err) => {
            console.log("getAll err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_HAS_PROMISE_0001
     * @tc.name   : testMpreferencesHasPromise0001
     * @tc.desc   : mPreference.has promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesHasPromise0001", 0, function (done) {
      console.log("testMpreferencesHasPromise0001 begin.");
      try {
        mPreference
          .has(123)
          .then((val) => {
            console.log("has err");
            expect(false).assertTrue();
          })
          .catch((err) => {
            console.log("has err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.").assertTrue();
        done();
        console.log("testMpreferencesHasPromise0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_HAS_PROMISE_0002
     * @tc.name   : testMpreferencesHasPromise0002
     * @tc.desc   : mPreference.has promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesHasPromise0002", 0, function (done) {
      console.log("testMpreferencesHasPromise0002 begin.");
      try {
        mPreference
          .has(KEY_TEST_STRING_ELEMENT)
          .then((val) => {
            done();
            console.log("testMpreferencesHasPromise0002 end.");
          })
          .catch((err) => {
            console.log("has err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_PROMISE_0001
     * @tc.name   : testMpreferencesPutPromise0001
     * @tc.desc   : mPreference.put promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutPromise0001", 0, function (done) {
      console.log("testMpreferencesPutPromise0001 begin.");
      try {
        mPreference
          .put(1233)
          .then(() => {
            console.log("put err");
            expect(false).assertTrue();
          })
          .catch((err) => {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 or 3 parameters!").assertTrue();
        done();
        console.log("testMpreferencesPutPromise0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_PROMISE_0002
     * @tc.name   : testMpreferencesPutPromise0002
     * @tc.desc   : mPreference.put promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutPromise0002", 0, function (done) {
      console.log("testMpreferencesPutPromise0002 begin.");
      try {
        mPreference
          .put(KEY_TEST_STRING_ELEMENT, "")
          .then(async () => {
            let per = await mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect("").assertEqual(per);
            done();
            console.log("testMpreferencesPutPromise0002 end.");
          })
          .catch((err) => {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
            done();
          });
      } catch (err) {
        console.log("trycatch err =1" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_PROMISE_0003
     * @tc.name   : testMpreferencesPutPromise0003
     * @tc.desc   : mPreference.put promise test   space
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutPromise0003", 0, function (done) {
      console.log("testMpreferencesPutPromise0003 begin.");
      try {
        mPreference
          .put(KEY_TEST_STRING_ELEMENT, " ")
          .then(async () => {
            let per = await mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
            expect(" ").assertEqual(per);

            done();
            console.log("testMpreferencesPutPromise0003 end.");
          })
          .catch((err) => {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            //expect(false).assertTrue();
            done();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        //expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_PROMISE_0004
     * @tc.name   : testMpreferencesPutPromise0004
     * @tc.desc   : mPreference.put promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutPromise0004", 0, function (done) {
      console.log("testMpreferencesPutPromise0004 begin.");
      try {
        mPreference
          .put(-1, 123)
          .then(() => {
            done();
            console.log("testMpreferencesPutPromise0004 end.");
          })
          .catch((err) => {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            done();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_PROMISE_0005
     * @tc.name   : testMpreferencesPutPromise0005
     * @tc.desc   : mPreference.put promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutPromise0005", 0, function (done) {
      console.log("testMpreferencesPutPromise0005 begin.");
      try {
        mPreference
          .put(KEY_TEST_STRING_ELEMENT, null)
          .then(() => {
            done();
            console.log("testMpreferencesPutPromise0005 end.");
          })
          .catch((err) => {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            done();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be ValueType.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_SYNC_WITH_ERROR_0001
     * @tc.name   : testMpreferencesPutSyncWithError0001
     * @tc.desc   : mPreference.putSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutSyncWithError0001", 0, function (done) {
      console.log("testMpreferencesPutSyncWithError0001 begin.");
      try {
        mPreference.putSync(1233);
        expect(false).assertTrue();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. Need 2 parameters!").assertTrue();
        done();
        console.log("testMpreferencesPutSyncWithError0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_SYNC_WITH_ERROR_0002
     * @tc.name   : testMpreferencesPutSyncWithError0002
     * @tc.desc   : mPreference.putSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutSyncWithError0002", 0, function (done) {
      console.log("testMpreferencesPutSyncWithError0002 begin.");
      try {
        mPreference.putSync(KEY_TEST_STRING_ELEMENT, "");
        let per = mPreference.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("").assertEqual(per);
        done();
        console.log("testMpreferencesPutSyncWithError0002 end.");
      } catch (err) {
        console.log("trycatch err =1" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_SYNC_WITH_ERROR_0003
     * @tc.name   : testMpreferencesPutSyncWithError0003
     * @tc.desc   : mPreference.putSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutSyncWithError0003", 0, function (done) {
      console.log("testMpreferencesPutSyncWithError0003 begin.");
      try {
        mPreference.putSync(KEY_TEST_STRING_ELEMENT, " ");
        let per = mPreference.getSync(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect(" ").assertEqual(per);
        done();
        console.log("testMpreferencesPutSyncWithError0003 end.");
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_SYNC_WITH_ERROR_0004
     * @tc.name   : testMpreferencesPutSyncWithError0004
     * @tc.desc   : mPreference.putSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutSyncWithError0004", 0, function (done) {
      console.log("testMpreferencesPutSyncWithError0004 begin.");
      try {
        mPreference.putSync(-1, 123);
        expect(false).assertTrue();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_PUT_SYNC_WITH_ERROR_0005
     * @tc.name   : testMpreferencesPutSyncWithError0005
     * @tc.desc   : mPreference.putSync test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPutSyncWithError0005", 0, function (done) {
      console.log("testMpreferencesPutSyncWithError0005 begin.");
      try {
        mPreference.putSync(KEY_TEST_STRING_ELEMENT, null);
        expect(false).assertTrue();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be ValueType.").assertTrue();
        done();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_DELETE_PROMISE_0001
     * @tc.name   : testMpreferencesDeletePromise0001
     * @tc.desc   : mPreference.delete promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesDeletePromise0001", 0, function (done) {
      console.log("testMpreferencesDeletePromise0001 begin.");
      try {
        mPreference
          .delete(1233)
          .then(() => {
            console.log("delete err");
            expect(false).assertTrue();
          })
          .catch((err) => {
            console.log("delete err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(err.code == 401 && err.message == "Parameter error. The type of 'value' must be string.").assertTrue();
        done();
        console.log("testMpreferencesDeletePromise0001 end.");
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_DELETE_PROMISE_0002
     * @tc.name   : testMpreferencesDeletePromise0002
     * @tc.desc   : mPreference.delete promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesDeletePromise0002", 0, function (done) {
      console.log("testMpreferencesDeletePromise0002 begin.");
      try {
        mPreference
          .delete(KEY_TEST_STRING_ELEMENT)
          .then(() => {
            done();
            console.log("testMpreferencesDeletePromise0002 end.");
          })
          .catch((err) => {
            console.log("delete err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_CLEAR_PROMISE_0001
     * @tc.name   : testMpreferencesClearPromise0001
     * @tc.desc   : mPreference.clear promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesClearPromise0001", 0, function (done) {
      console.log("testMpreferencesClearPromise0001 begin.");
      try {
        mPreference
          .clear()
          .then(() => {
            done();
            console.log("testMpreferencesClearPromise0001 end.");
          })
          .catch((err) => {
            console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number : TEST_MPREFERENCES_FLUSH_PROMISE_0001
     * @tc.name   : testMpreferencesFlushPromise0001
     * @tc.desc   : mPreference.flush promise test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesFlushPromise0001", 0, function (done) {
      console.log("testMpreferencesFlushPromise0001 begin.");
      try {
        mPreference
          .flush()
          .then(() => {
            done();
            console.log("testMpreferencesFlushPromise0001 end.");
          })
          .catch((err) => {
            console.log("flush err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(false).assertTrue();
          });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(false).assertTrue();
      }
    });
  });
}
