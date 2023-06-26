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

import gestureEvent from '@ohos.multimodalInput.gestureEvent';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function MultimodalInput_GestureEvent_test() {
  describe('MultimodalInput_GestureEvent_test', function () {

    it('Multimodalinput_GestureEvent_SUB_MMI_GestureEventTest_001', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_001 enter`);

      expect(gestureEvent.ActionType.CANCEL == 0).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_001 exit`);
    })

    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002 enter`);

      expect(gestureEvent.ActionType.BEGIN == 1).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_002 exit`);
    })

    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003 enter`);

      expect(gestureEvent.ActionType.UPDATE == 2).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_003 exit`);
    })

    it('Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004', 0, function () {
      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004 enter`);

      expect(gestureEvent.ActionType.END == 3).assertTrue();

      console.info(`Multimodalinput_GestureEvent_test_SUB_MMI_GestureEvent_004 exit`);
    })
  })
}