/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';
import text from "@ohos.graphics.text"

export default function graphicFontDescriptorTest() {
  describe('graphicFontDescriptor_test', () => {
    beforeAll(() => {})

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_001
     * @tc.name      : testMatchingFontDescriptors001
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors001', 7, async (done: Function) => {
      let msg = "testMatchingFontDescriptors001"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({})
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          done();
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get all desc failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_002
     * @tc.name      : testMatchingFontDescriptors002
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors002', 7, async (done: Function) => {
      let msg = "testMatchingFontDescriptors002"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          weight: -1,
        })
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.error(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_003
     * @tc.name      : testMatchingFontDescriptors003
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors003', 7, async (done:Function) => {
      let msg = "testMatchingFontDescriptors003"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          weight: null,
        });
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_004
     * @tc.name      : testMatchingFontDescriptors004
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors004', 7, async (done:Function) => {
      let msg = "testMatchingFontDescriptors004"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          weight: undefined,
        });
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_005
     * @tc.name      : testMatchingFontDescriptors005
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors005', 7, async (done:Function) => {
      let msg = "testMatchingFontDescriptors005"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors(null);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_006
     * @tc.name      : testMatchingFontDescriptors006
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors006', 7, async (done:Function) => {
      let msg = "testMatchingFontDescriptors006"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors(undefined);
        await promise.then(async (data) => {
          expect().assertFail();
          done()
        }).catch((err: BusinessError) => {
          expect(promise).assertPromiseIsRejected();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_007
     * @tc.name      : testMatchingFontDescriptors007
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors007', 7, async (done:Function) => {
      let msg = "testMatchingFontDescriptors007"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          fontFamily: "HarmonyOS Sans"
        });
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          expect(data[0].fontFamily).assertEqual("HarmonyOS Sans");
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get HarmonyOS Sans font failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHICTEXT_JS_API_008
     * @tc.name      : testMatchingFontDescriptors008
     * @tc.desc      : To test interface matchFontDescriptors of text.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testMatchingFontDescriptors008', 7, async (done:Function) => {
      let msg = "testMatchingFontDescriptors008"
      console.info(msg + ' begin');
      try {
        let promise = text.matchFontDescriptors({
          fontFamily: "HarmonyOS Sans",
          weight: text.FontWeight.W400,
        });
        await promise.then(async (data) => {
          expect(data.length).not().assertEqual(0);
          expect(data[0].fontFamily).assertEqual("HarmonyOS Sans");
          expect(data[0].weight).assertEqual(text.FontWeight.W400);
          done()
        }).catch((err: BusinessError) => {
          console.error(msg + ` Get HarmonyOS Sans font failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done()
        })
      } catch (err) {
        console.info(msg + ' failed, Cause: ' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
    })

  })
}