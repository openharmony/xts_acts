/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import inputEventClient from '@ohos.multimodalInput.inputEventClient';
import inputDevice from '@ohos.multimodalInput.inputDevice';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

const REGISTERED_SUCCESS = 1;
const REGISTERED_FAILED = -1;
const EventCallback = {
    ON_SHOW_MENU: 0,
    ON_SEND: 1,
    ON_COPY: 2,
    ON_PASTE: 3,
    ON_CUT: 4,
    ON_UNDO: 5,
    ON_REFRESH: 6,
    ON_CANCEL: 8,
    ON_ENTER: 9,
    ON_PREVIOUS: 10,
    ON_NEXT: 11,
    ON_BACK: 12,
    ON_PRINT: 13,
    ON_ANSWER: 14,
    ON_REFUSE: 15,
    ON_HANGUP: 16,
    ON_TELEPHONE_CONTROL: 17,
    ON_PLAY: 18,
    ON_PAUSE: 19,
    ON_MEDIA_CONTROL: 20,
};

const EVENT_UUID = 'uuid-ut';
const EVENT_SOURCE_TYPE = 65535;
const EVENT_DEVICE_ID = 65535;
const CLEAR_ALL_TYPE = 255;
const WINDOW_ID = 123;
const UNIT_TEST_SUCCESS = 0;

describe('ts_unit_test', function () {

  it('inputEventClient::answer_test-01', 0, function () {
    const multimodalEvent = {
      uuid: EVENT_UUID,
      occurredTime: Date.now(),
      sourceDevice: EVENT_SOURCE_TYPE,
      inputDeviceId: EVENT_DEVICE_ID,
      type: EventCallback.ON_ANSWER,
    }

    const eventHandle = (event) => {
      expect(event.uuid).assertEqual(multimodalEvent.uuid);
      expect(event.occurredTime).assertEqual(multimodalEvent.occurredTime);
      expect(event.sourceDevice).assertEqual(multimodalEvent.sourceDevice);
      expect(event.inputDeviceId).assertEqual(multimodalEvent.inputDeviceId);
      expect(event.type).assertEqual(multimodalEvent.type);
    }

    const registerResult = inputEventClient.on('answer', eventHandle);
    // 新框架老的接口应该注册失败
    expect(registerResult).assertEqual(REGISTERED_FAILED);
  })

  it('inputDevice::getDeviceIds_test-01', 0, function () {
    console.log(`inputDevice::getDeviceIds_test-01 enter`);

    inputDevice.getDeviceIds((obj) => {
      if (!obj) {
        console.log(`inputDevice::getDeviceIds_test-01 error:${JSON.stringify(obj)}`)
        expect(false).assertTrue();
        return;
      } else {
        console.log(`inputDevice::getDeviceIds_test-01 success:${JSON.stringify(obj)}`);
        expect(true).assertTrue();
      }

      console.log(`inputDevice::getDeviceIds_test-01 exit`);
    })
  })

})
