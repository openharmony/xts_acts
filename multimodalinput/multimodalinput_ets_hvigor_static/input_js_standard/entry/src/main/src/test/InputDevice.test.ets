/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import inputDevice from '@ohos.multimodalInput.inputDevice';
import { AsyncCallback } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function inputDeviceOnTest() {
  describe("InputDevice_on_test", async (): Promise<void> => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    it("InputDevice_on_test", 0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, `InputDevice_on_test enter`);
      try {
        let isPhysicalKeyboardExist = true;
        inputDevice.on("change", (data) => {
          hilog.info(domain, tag, `InputDevice_on_test type: ${data.type}, deviceId: ${data.deviceId}`);
        });
      } catch (error) {
        hilog.info(domain, tag, `InputDevice_on_test error`);
        expect(false).assertTrue();
      }
      hilog.info(domain, tag, `InputDevice_on_test exit`);
      done();
    })
  })
  hilog.info(domain, tag, '%{public}s', 'describe end');
}