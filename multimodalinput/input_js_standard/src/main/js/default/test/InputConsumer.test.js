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
// @ts-nocheck
import process from '@ohos.process';
import inputConsumer from "@ohos.multimodalInput.inputConsumer";
import inputEventClient from "@ohos.multimodalInput.inputEventClient";
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect
} from 'deccjsunit/index'

describe('MultimodalInputConsumer_test', function () {
  it('inputConsumer::inputConsumer_test01', 0, function () {
    let label = '02800/MultimodalinputJs';
    let keyCode = 2018;
    console.log(`${label}:onClickConsumerOn start`)
    let params = {
      preKeys: [],
      finalKey: keyCode,
      isFinalKeyDown: false,
      finalKeyDownDuration: 0,
    };

    console.log(`${label}:onClickConsumerOn callback`)
    const handleCallback = (data) => {
      console.log(`${label}:callbackKey start`);
      if (!data) {
        console.log(`${label}:callbackKey error:${JSON.stringify(data)}`);
        expect(false).assertTrue();
        return;
      }
      console.log(`${label}:callbackKey success: ${JSON.stringify(data)}`);
      expect(data.finalKey == keyCode).assertTrue();
    };

    inputConsumer.on("key", params, handleCallback);
    console.log(`${label}:onClickConsumerOn end`)

    console.log(`${label}:onClickInjectKey start`)
    let keyDown = {
      isPressed: true,
      keyCode: keyCode,
      keyDownDuration: 200,
    }
    let ret = inputEventClient.injectEvent({
      KeyEvent: keyDown
    });
    ret == 0 ? console.log(`${label}:onClickInjectKey success`) : console.log(`${label}:onClickInjectKey failed`);

    console.log(`${label}:onClickInjectKey up`)
    let keyUp = {
      isPressed: false,
      keyCode: keyCode,
      keyDownDuration: 200,
    }
    let retUp = inputEventClient.injectEvent({
      KeyEvent: keyUp
    });
    retUp == 0 ? console.log(`${label}:onClickInjectKey success`) : console.log(`${label}:onClickInjectKey failed`);

    setTimeout(() => {
      console.log(`${label}:onClickConsumerOff start`)
      inputConsumer.off("key", params, handleCallback);
      console.log(`${label}:onClickConsumerOff end`);
    }, 3000);
    console.log(`${label}:onClickInjectKey end`)
  })
})