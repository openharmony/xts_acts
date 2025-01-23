/*
 * Copyright (C) 2024 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium';
import { KeyCode } from '@kit.InputKit';

export default function MultimodalInputKeyCodeTest() {
  describe("MultimodalInputKeyCodeTest", ()=> {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100
     * @tc.desc: Test keycode KEYCODE_SWITCHVIDEOMODE.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_SWITCHVIDEOMODE_0100";
      try {
        let KEYCODE_SWITCHVIDEOMODE = KeyCode.KEYCODE_SWITCHVIDEOMODE;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_SWITCHVIDEOMODE)}`);
        ExpectTrue(KEYCODE_SWITCHVIDEOMODE == 2841);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_SEARCH_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_SEARCH_0100
     * @tc.desc: Test keycode KEYCODE_SEARCH.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_SEARCH_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_SEARCH_0100";
      try {
        let KEYCODE_SEARCH = KeyCode.KEYCODE_SEARCH;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_SEARCH)}`);
        ExpectTrue(KEYCODE_SEARCH == 9);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100
     * @tc.desc: Test keycode KEYCODE_MEDIA_RECORD.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_MEDIA_RECORD_0100";
      try {
        let KEYCODE_MEDIA_RECORD = KeyCode.KEYCODE_MEDIA_RECORD;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_MEDIA_RECORD)}`);
        ExpectTrue(KEYCODE_MEDIA_RECORD == 2089);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100
     * @tc.desc: Test keycode KEYCODE_ASSISTANT.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_ASSISTANT_0100";
      try {
        let KEYCODE_ASSISTANT = KeyCode.KEYCODE_ASSISTANT;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_ASSISTANT)}`);
        ExpectTrue(KEYCODE_ASSISTANT == 2722);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_KEYCODE_DAGGER_LONG_PRESS_0100
     * @tc.name: SUB_MMI_Input_Api_KEYCODE_DAGGER_LONG_PRESS_0100
     * @tc.desc: Test keycode KEYCODE_DAGGER_LONG_PRESS.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_KEYCODE_DAGGER_LONG_PRESS_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_KEYCODE_DAGGER_LONG_PRESS_0100";
      try {
        let KEYCODE_DAGGER_LONG_PRESS = KeyCode.KEYCODE_DAGGER_LONG_PRESS;
        console.info(`${caseName} success, keyCode value ${JSON.stringify(KEYCODE_DAGGER_LONG_PRESS)}`);
        ExpectTrue(KEYCODE_DAGGER_LONG_PRESS == 3213);
        done();
      } catch (error) {
        console.info(`${caseName} fail, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}