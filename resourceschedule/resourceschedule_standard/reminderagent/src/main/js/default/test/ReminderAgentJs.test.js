/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'
import deviceinfo from '@ohos.deviceInfo'

describe('ReminderAgentTest', function () {

  const MAX_CHARACTERS_NUM_ONE = 33;
  const MAX_CHARACTERS_NUM_TWO = 65;
  const MAX_CHARACTERS_NUM = 0;

  beforeAll(function() {

    /*
     * @tc.setup: setup invoked before all testcases
     */
     console.info('beforeAll caled')
})

afterAll(function() {

    /*
     * @tc.teardown: teardown invoked after all testcases
     */
     console.info('afterAll caled')
})

beforeEach(function() {

    /*
     * @tc.setup: setup invoked before each testcases
     */
     console.info('beforeEach caled')
})

afterEach(function() {
  
    /*
     * @tc.teardown: teardown invoked after each testcases
     */
     console.info('afterEach caled')
})

  console.info('start################################start');
  
  /**
   * @tc.number    SUB_STARTUP_JS_DEVCEINFO_0100
   * @tc.name      testGetDeviceType01
   * @tc.desc      Get a string representing the device type.
   * @tc.size      : MEDIUM
   * @tc.type      : Function
   * @tc.level     : Level 0
   */
  it('device_info_test_001', 0, function () {
    console.info('device_info_test_001 start');
    let ret = false;
    let deviceTypeInfo = deviceinfo.deviceType;
    console.info('the value of the deviceType is :' + deviceTypeInfo);

    expect(deviceTypeInfo).assertInstanceOf('String');
    if (deviceTypeInfo != "" && deviceTypeInfo != null && deviceTypeInfo != undefined) {
      ret = true;
    }
    expect(ret).assertTrue()
    console.info('device_info_test_001 : end');
  })
})


