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
import inputMonitor from "@ohos.multimodalInput.inputMonitor";
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect
} from 'deccjsunit/index'

describe('MultimodalInputMonitor_test', function () {
  it('inputMonitor::inputMonitor_test01', 0, function () {
    let label = '02800/MultimodalinputJs';
    console.log(`${label}:onClickMonitorOn start`)

    console.log(`${label}:onClickMonitorOn callback`)
    const handleCallback = (err, data) => {
      console.log(`${label}:callbackTouch start`);
      if (err) {
        console.log(`${label}:callbackTouch error:${JSON.stringify(err)}`);
        expect(false).assertTrue();
        return;
      }
      console.log(`${label}:callbackTouch success: ${JSON.stringify(data)}`);
      let ret = Object.keys(data);
      expect(ret.length > 0).assertTure();
    };

    console.log(`${label}:onClickMonitorOn start`);
    inputMonitor.on("touch", handleCallback)
    console.log(`${label}:onClickMonitorOn end`);

    console.log(`${label}:onClickMonitorOff start`);
    inputMonitor.off("touch")
    console.log(`${label}:onClickMonitorOff end`);
  })
})