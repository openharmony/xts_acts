/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import AVSessionManager from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';


const TAG = "[AVSessionManagerJSTest]";
export default function AVSessionManagerJSTest() {
  describe("AVSessionManagerJSTest", function () {
    let session = null;
    let controller = null;
    let receivedCallback = false;
    let receivedCallback2 = false;
    let context = featureAbility.getContext();

    const INVALID_STRING = "invalid string";
    const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
    const UPDATE_LYRICS_WANT_PARAMS = {
      lyrics: "This is my lyrics"
    }

    beforeAll(async function () {
      console.info(TAG + "beforeAll called");
    })

    afterAll(function () {
      console.info(TAG + 'afterAll called');
    })

    beforeEach(function () {
      console.info(TAG + 'beforeEach called');
    })

    afterEach(function () {
      console.info(TAG + 'afterEach called');
    })

    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }

    async function createSessionTask() {
      session = await AVSessionManager.createAVSession(context, "AVSessionDemo", 'audio').catch((err) => {
        console.error(TAG + "Create AVSession error " + JSON.stringify(err));
        expect().assertFail();
      });
      console.info(TAG + "Create session finished");
    }

    function destroySessionTask() {
      session.destroy();
      console.info(TAG + 'Destroy session finished');
    }

    async function createControllerTask() {
      controller = await AVSessionManager.createController(session.sessionId).catch((err) => {
        console.error(TAG + "Create controller error " + JSON.stringify(err));
        expect().assertFail();
      });
      console.info(TAG + "Create controller finished");
    }

    function destroyControllerTask() {
      controller.destroy();
      console.info(TAG + 'Destroy session finished');
    }

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0100
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0100", 0, async function (done) {
      await createSessionTask();
      let descriptors = await AVSessionManager.getHistoricalSessionDescriptors().catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0100 error " + JSON.stringify(err));
        expect().assertFail();
        destroySessionTask();
        done();
      });
      if (descriptors.length >= 1) {
        console.info(`getHistoricalSessionDescriptors : SUCCESS : descriptors[0].isActive : ${descriptors[0].isActive}`);
        console.info(`getHistoricalSessionDescriptors : SUCCESS : descriptors[0].type : ${descriptors[0].type}`);
        console.info(`getHistoricalSessionDescriptors : SUCCESS : descriptors[0].sessionTag : ${descriptors[0].sessionTag}`);
        console.info(`getHistoricalSessionDescriptors : SUCCESS : descriptors[0].sessionId : ${descriptors[0].sessionId}`);
        console.info(`getHistoricalSessionDescriptors : SUCCESS : descriptors[0].elementName.bundleName : ${descriptors[0].elementName.bundleName}`);
        expect(true).assertTrue();
      } else {
        console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0100 get history session number : " + descriptors.length + ", error ");
        expect().assertFail();
      }
      destroySessionTask();
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0200
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0200", 0, async function (done) {
      await createSessionTask();
      let descriptors = await AVSessionManager.getHistoricalSessionDescriptors(10).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0200 error " + JSON.stringify(err));
        expect().assertFail();
        destroySessionTask();
        done();
      });
      if (descriptors.length >= 1) {
        expect(true).assertTrue();
      } else {
        console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0200 get history session number : " + descriptors.length + ", error ");
        expect().assertFail();
      }
      destroySessionTask();
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0300
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0300", 0, async function (done) {
      await createSessionTask();
      let descriptors = await AVSessionManager.getHistoricalSessionDescriptors(0).catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0300 error " + JSON.stringify(err));
        expect().assertFail();
        destroySessionTask();
        done();
      });
      if (descriptors.length == 0) {
        expect(true).assertTrue();
      } else {
        console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0300 get history session number : " + descriptors.length + ", error ");
        expect().assertFail();
      }
      destroySessionTask();
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0400
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0400", 0, async function (done) {
      let flag = false;
      await createSessionTask();
      let descriptors = await AVSessionManager.getHistoricalSessionDescriptors("0").catch((err) => {
        flag = true;
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0400 param error " + JSON.stringify(err));
        expect(true).assertTrue();
        destroySessionTask();
        done();
      });
      if (flag || (!descriptors)) {
        console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0400 error input param has callback , pass");
        expect(true).assertTrue();
        destroySessionTask();
        done();
      } else {
        console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0400 error input param should not return , error");
        expect().assertFail();
        destroySessionTask();
        done();
      }
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0500
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0500", 0, async function (done) {
      await createSessionTask();
      await AVSessionManager.getHistoricalSessionDescriptors((err, data) => {
        if (err) {
          console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0500 error " + JSON.stringify(err));
          expect().assertFail();
          destroySessionTask();
          done();
        }
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0500 return :" + data);
        if (data.length >= 1) {
          expect(true).assertTrue();
        } else {
          console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0500 get history session number : " + data.length + ", error ");
          expect().assertFail();
        }
        destroySessionTask();
        done();
      });
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0600
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0600", 0, async function (done) {
      await createSessionTask();
      destroySessionTask();
      let descriptors = await AVSessionManager.getHistoricalSessionDescriptors().catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0600 error " + JSON.stringify(err));
        expect().assertFail();
        destroySessionTask();
        done();
      });
      if (descriptors.length >= 1) {
        expect(true).assertTrue();
      } else {
        console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0600 get history session number : " + descriptors.length + ", error ");
        expect().assertFail();
      }
      destroySessionTask();
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0700
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0700", 0, async function (done) {
      let descriptors = await AVSessionManager.getHistoricalSessionDescriptors().catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0700 error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      let size = descriptors.length;
      await createSessionTask();
      destroySessionTask();
      let descriptorsRetry = await AVSessionManager.getHistoricalSessionDescriptors().catch((err) => {
        console.error(TAG + "SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0700 retry error " + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      if (descriptorsRetry.length >= size) {
        expect(true).assertTrue();
      } else {
        console.error(TAG + " SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0700 get history session number : " + descriptors.length + ", error ");
        expect().assertFail();
      }
      done();
    })

    /*
   * @tc.name:SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0800
   * @tc.desc:One on function - lyrics session event
   * @tc.type: FUNC
   * @tc.require: I6C6IN
   */
    it("SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0800", 0, async function (done) {
      await createSessionTask();
      for (let i = 0; i < 100; i++) {
        let descriptors = await AVSessionManager.getHistoricalSessionDescriptors().catch((err) => {
          console.error(TAG + " loop : " + i + ", SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0800 error " + JSON.stringify(err));
          expect().assertFail();
          destroySessionTask();
          done();
        });
        if (descriptors.length >= 1) {
          expect(true).assertTrue();
        } else {
          console.error(TAG + " loop : " + i + ", SUB_MULTIMEDIA_GETHISTORICAL_SESSIONDESCRIPTORS_0800 get history session number : " + descriptors.length + ", error ");
          expect().assertFail();
          destroySessionTask();
          done();
        }
      }
      destroySessionTask();
      done();
    })
  })
}